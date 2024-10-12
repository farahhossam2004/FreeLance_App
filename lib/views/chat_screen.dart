import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:freelance_app/widgets/custom_message_bubble.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:freelance_app/services/file_picker_mobile_desktop.dart'
    if (dart.library.html) 'package:freelance_app/services/file_picker_web.dart';

class ChatScreen extends StatefulWidget {
  final types.User user;
  final String conversationId; // A unique ID for the conversation.
  final String userRole;
  const ChatScreen(
      {super.key,
      required this.user,
      required this.conversationId,
      required this.userRole});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

String randomString() {
  final random = Random.secure();
  final values = List<int>.generate(16, (i) => random.nextInt(255));
  return base64UrlEncode(values);
}

class _ChatScreenState extends State<ChatScreen> {
  final List<types.Message> _messages = [];
  final TextEditingController _controller = TextEditingController();
  StreamSubscription? _messageSubscription;

  CollectionReference conversations =
      FirebaseFirestore.instance.collection('Chat-Conversations');

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  void _loadMessages() {
    // Listen to the Firestore collection in real-time
    conversations
        .doc(widget.conversationId)
        .collection('messages')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .listen((messageSnapshot) {
      final messages = messageSnapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;

        // Check if the message is an image or text message
        if (data.containsKey('imageUrl')) {
          // Handle image message
          return types.ImageMessage(
            name: data['imageName'] ??
                'Unknown image name', // Add this line for the required 'name' parameter
            size: data['imageSize'] ?? 0,
            author: types.User(
              id: data['authorID'],
              firstName: data['authorName'],
            ),
            id: doc.id,
            uri: data['imageUrl'], // URL of the image
            createdAt:
                data['createdAt'] ?? DateTime.now().millisecondsSinceEpoch,
          );
        } else {
          // Handle text message
          return types.TextMessage(
            author: types.User(
              id: data['authorID'],
              firstName: data['authorName'],
            ),
            id: doc.id,
            text: data['text'],
            createdAt:
                data['createdAt'] ?? DateTime.now().millisecondsSinceEpoch,
          );
        }
      }).toList();

      if (mounted) {
        setState(() {
          _messages.clear();
          _messages.addAll(messages);
        });
      }
    }).onError((error) {
      debugPrint('Error fetching messages: $error');
    });
  }

// @override
// void dispose() {
//   // Cancel the Firestore listener when the widget is disposed
//   _messageSubscription?.cancel();
//   super.dispose();
// }

  // void _loadInitialMessages() {
  //   final initialMessage = types.TextMessage(
  //     id: 'msg1',
  //     text: 'Welcome to the chat!',
  //     author: widget.user,
  //     createdAt: DateTime.now().millisecondsSinceEpoch,
  //   );

  //   _addMessage(initialMessage);
  // }

  void _handleSendPressed(types.PartialText message) async {
    final textMessage = types.TextMessage(
        author: widget.user,
        id: DateTime.now().toString(),
        text: message.text,
        createdAt: DateTime.now().millisecondsSinceEpoch);

    // _addMessage(textMessage);
    await _sendMessageToFirestore(textMessage);

    // send the message to the backend
  }

  Future<void> _sendMessageToFirestore(types.Message message) async {
    final data = {
      'authorID': message.author.id,
      'authorName': widget.user.firstName,
      'createdAt': message.createdAt,
    };

    if (message is types.TextMessage) {
      data['text'] = message.text;
    } else if (message is types.ImageMessage) {
      data['imageUrl'] = message.uri; // Store image URL
      data['height'] = message.height;
      data['width'] = message.width;
    } else if (message is types.FileMessage) {
      data['fileUrl'] = message.uri; // Store file URL
      data['fileName'] = message.name;
      data['fileSize'] = message.size;
    }

    await conversations
        .doc(widget.conversationId)
        .collection('messages')
        .add(data);

    await conversations.doc(widget.conversationId).update({
      'lastMessage': message is types.TextMessage ? message.text : 'File sent',
      'lastMessageAt': message.createdAt,
    });
  }

  void _handleImageSelection() async {
  // Show a loading indicator dialog
  final loadingDialog = showDialog(
    context: context,
    barrierDismissible: false, // Prevent dismissing the dialog when tapping outside
    builder: (context) => AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          const SizedBox(width: 10),
          const Text("Sending..."),
        ],
      ),
    ),
  );

  try {
    if (kIsWeb) {
      // Web-specific logic: Use FilePicker for web
      final result = await FilePicker.platform.pickFiles(type: FileType.image);

      if (result != null && result.files.single.bytes != null) {
        debugPrint("Image selected on web: ${result.files.single.name}");

        // Upload image to Firebase Storage
        final fileName = result.files.single.name;
        final storageRef =
            FirebaseStorage.instance.ref().child('chat_images/$fileName');

        final uploadTask = storageRef.putData(result.files.single.bytes!);
        final taskSnapshot = await uploadTask.whenComplete(() {});
        final downloadUrl = await taskSnapshot.ref.getDownloadURL();

        // Create the ImageMessage with the current timestamp
        final message = types.ImageMessage(
          author: widget.user,
          id: randomString(),
          name: fileName,
          size: result.files.single.size,
          uri: downloadUrl,
          createdAt: DateTime.now().millisecondsSinceEpoch, // Use the current timestamp
          height: 300, // Set default height and width for web
          width: 300,
        );

        await _sendMessageToFirestore(message);
        // Close the modal bottom sheet
        Navigator.pop(context);
      } else {
        debugPrint("No image selected or user canceled.");
      }
    } else {
      // Mobile-specific logic: Use ImagePicker for mobile platforms
      final result = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
        maxHeight: 1440,
      );

      if (result != null) {
        final bytes = await result.readAsBytes();
        final fileName = result.name;
        final storageRef =
            FirebaseStorage.instance.ref().child('chat_images/$fileName');

        final uploadTask = storageRef.putData(bytes);
        final taskSnapshot = await uploadTask.whenComplete(() {});
        final downloadUrl = await taskSnapshot.ref.getDownloadURL();

        // Create the ImageMessage with the current timestamp
        final image = await decodeImageFromList(bytes);

        final message = types.ImageMessage(
          author: widget.user,
          id: randomString(),
          name: fileName,
          size: bytes.length,
          uri: downloadUrl,
          height: image.height.toDouble(),
          width: image.width.toDouble(),
          createdAt: DateTime.now().millisecondsSinceEpoch, // Use the current timestamp
        );

        await _sendMessageToFirestore(message);
        // Close the modal bottom sheet
        Navigator.pop(context);
      }
    }
  } catch (e) {
    debugPrint("Error: $e");
  } finally {
    // Hide the loading dialog
    Navigator.of(context).pop(); // Close the loading dialog
  }
}


  void _handleMessageTap(BuildContext _, types.Message message) async {
    if (message is types.FileMessage) {
      var localPath = message.uri;

      if (message.uri.startsWith('http')) {
        try {
          final index =
              _messages.indexWhere((element) => element.id == message.id);
          final updatedMessage =
              (_messages[index] as types.FileMessage).copyWith(
            isLoading: true,
          );

          setState(() {
            _messages[index] = updatedMessage;
          });

          final client = http.Client();
          final request = await client.get(Uri.parse(message.uri));
          final bytes = request.bodyBytes;
          final documentsDir = (await getApplicationDocumentsDirectory()).path;
          localPath = '$documentsDir/${message.name}';

          if (!File(localPath).existsSync()) {
            final file = File(localPath);
            await file.writeAsBytes(bytes);
          }
        } finally {
          final index =
              _messages.indexWhere((element) => element.id == message.id);
          final updatedMessage =
              (_messages[index] as types.FileMessage).copyWith(isLoading: null);

          setState(() {
            _messages[index] = updatedMessage;
          });
        }
      }
      await OpenFilex.open(localPath);
    }
  }

  void _handlePreviewDataFetched(
    types.TextMessage message,
    types.PreviewData previewData,
  ) {
    final index = _messages.indexWhere((element) => element.id == message.id);
    final updatedMessage = (_messages[index] as types.TextMessage).copyWith(
      previewData: previewData,
    );

    setState(() {
      _messages[index] = updatedMessage;
    });
  }

  void _handleFileSelection() async {
    debugPrint("File selection initiated");
    try {
      final result = await FilePicker.platform.pickFiles(type: FileType.any);

      if (result != null) {
        if (kIsWeb) {
          // Web-specific logic: Use the bytes property
          if (result.files.single.bytes != null) {
            debugPrint("File picked on web: ${result.files.single.name}");

            // Store the bytes in a map or similar structure
            final fileData = {
              'name': result.files.single.name,
              'size': result.files.single.size,
              'bytes': result.files.single.bytes,
            };

            final message = types.FileMessage(
              author: widget.user,
              id: randomString(),
              name: result.files.single.name,
              size: result.files.single.size,
              uri: 'web',
              metadata: fileData,
              // Since there's no file path on the web, use a placeholder
            );

            // _addMessage(message);
            debugPrint(
                "File message created on web with size: ${message.size} bytes");
          } else {
            debugPrint("File selection on web failed, no bytes available.");
          }
        } else {
          // Non-web logic (Android, iOS)
          if (result.files.single.path != null) {
            debugPrint("File picked on mobile: ${result.files.single.name}");

            final message = types.FileMessage(
              author: widget.user,
              id: randomString(),
              name: result.files.single.name,
              size: result.files.single.size,
              uri: result.files.single.path!,
              // Use the file path for non-web platforms
            );

            debugPrint("File message created with path: ${message.uri}");
            // _addMessage(message);
          } else {
            debugPrint("File path is null.");
          }
        }
      } else {
        debugPrint("No file selected or user canceled.");
      }
    } catch (e) {
      debugPrint("Error during file selection: $e");
    }
  }

  void _handleAttachmentPressed() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          debugPrint("Modal opened");
          return SizedBox(
            height: 160,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(
                  height: 5,
                ),
                TextButton(
                    onPressed: () {
                      _handleImageSelection();
                      // Navigator.pop(context);
                    },
                    child: const Align(
                      alignment: AlignmentDirectional.center,
                      child: Text(
                        'Photo',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black),
                      ),
                    )),
                const Divider(
                  height: 1,
                  thickness: 1,
                  color: Color.fromARGB(255, 131, 125, 125),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      _handleFileSelection();
                    },
                    child: const Align(
                      alignment: AlignmentDirectional.center,
                      child: Text('File',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black)),
                    )),
                const Divider(
                  height: 2,
                  thickness: 1,
                  color: Color.fromARGB(255, 131, 125, 125),
                ),
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Align(
                      alignment: AlignmentDirectional.center,
                      child: Text('Cancel',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.red)),
                    ))
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          const CircleAvatar(
            backgroundImage: AssetImage('assets/profile.jpeg'),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            widget.user.firstName as String,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ]),
      ),
      body: Chat(
          showUserNames: true,
          disableImageGallery: true,
          onAttachmentPressed: _handleAttachmentPressed,
          onMessageTap: _handleMessageTap,
          onPreviewDataFetched: _handlePreviewDataFetched,
          messages: _messages,
          onSendPressed: _handleSendPressed,
          user: widget.user,
          customBottomWidget: _buildCustomInput(),
          bubbleBuilder: (Widget defaultMessage,
              {required types.Message message,
              required bool nextMessageInGroup}) {
            if (message is types.TextMessage) {
              return CustomMessageBubble(
                message: message,
                isCurrentUser: message.author.id == widget.user.id,
              );
            } else if (message is types.ImageMessage) {
              return buildImageMessage(message);
              // return CustomMessageBubble(
              //     message: message,
              //     isCurrentUser: message.author.id == widget.user.id);
            } else if (message is types.FileMessage) {
              return _buildFileMessage(message);
            }
            return defaultMessage;
          }),
    );
  }

  Widget _buildCustomInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                  hintText: 'Type a message...',
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  )),
              style: const TextStyle(fontSize: 16),
              onSubmitted: (text) {
                if (text.isNotEmpty) {
                  _handleSendPressed(types.PartialText(text: text));
                  _controller.clear();
                }
              },
            ),
          ),
          IconButton(
            onPressed: _handleAttachmentPressed,
            icon: const Icon(Icons.attach_file),
            color: Colors.grey,
          ),
          IconButton(
            onPressed: () {
              if (_controller.text.isNotEmpty) {
                _handleSendPressed(types.PartialText(text: _controller.text));
                _controller.clear();
              }
            },
            icon: const Icon(
              Icons.send,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFileMessage(types.FileMessage message) {
    final isCurrentUser = message.author.id == widget.user.id;

    if (kIsWeb &&
        message.metadata != null &&
        message.metadata!['bytes'] != null) {
      // Web rendering logic for downloading the file
      return Align(
        alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
            color: isCurrentUser ? Colors.green : Colors.grey[300],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${message.name}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
              ElevatedButton(
                onPressed: () {
                  downloadFileFromBytes(
                      message.metadata!['bytes'], message.name);
                  // Logic for downloading the file on web
                  // final blob = html.Blob([message.metadata!['bytes']]);
                  // final url = html.Url.createObjectUrlFromBlob(blob);
                  // final anchor = html.AnchorElement(href: url)
                  //   ..setAttribute('download', message.name)
                  //   ..click();
                  // html.Url.revokeObjectUrl(url);
                },
                child: const Text(
                  "Download",
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Align(
        alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
            color: isCurrentUser ? Colors.green : Colors.grey[300],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text('${message.name}',
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white)),
        ),
      );
    }
  }

  Widget buildImageMessage(types.ImageMessage message) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Image.network(
        message.uri, // Ensure this is the correct image URL
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(child: CircularProgressIndicator());
        },
        errorBuilder: (context, error, stackTrace) {
          return Text('Image failed to load'); // Handle errors
        },
      ),
    );
  }
}
