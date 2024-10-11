// ignore_for_file: unused_local_variable, use_super_parameters

import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:freelance_app/services/file_picker_mobile_desktop.dart'
    if (dart.library.html) 'package:freelance_app/services/file_picker_web.dart';

class CustomMessageBubble extends StatelessWidget {
  final types.Message message;
  final bool isCurrentUser;

  const CustomMessageBubble({
    Key? key,
    required this.message,
    required this.isCurrentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (message is types.TextMessage) {
      // Handling Text Messages
      final textMessage = message as types.TextMessage;
      return Align(
        alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
            color: isCurrentUser ? Colors.green : Colors.grey[300],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            textMessage.text,
            style: TextStyle(
              color: isCurrentUser ? Colors.white : Colors.black,
            ),
          ),
        ),
      );
    } else if (message is types.ImageMessage) {
      // Handling Image Messages
      final imageMessage = message as types.ImageMessage;
      return _buildImageMessage(imageMessage);
    } else if (message is types.FileMessage) {
      // Handling File Messages
      final fileMessage = message as types.FileMessage;
      return _buildFileMessage(fileMessage);
    }

    // Default case when none of the above message types match
    return Container(color: Colors.red);
  }

  Widget _buildImageMessage(types.ImageMessage imageMessage) {
    if (kIsWeb) {
      // Web platform handling for image
      return SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              imageMessage.uri,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Text('Image Failed to load');
              },
            )
          ],
        ),
      );
    } else {
      // Native platform handling for image
      return SingleChildScrollView(
        child: Column(
          children: [
            Image.file(
              File(imageMessage.uri),
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Text('Image failed to load');
              },
            )
          ],
        ),
      );
    }
  }

  Widget _buildFileMessage(types.FileMessage fileMessage) {
    if (kIsWeb && fileMessage.metadata != null) {
      // Web-specific file download logic
      final fileData = fileMessage.metadata as Map<String, dynamic>;

      // Ensure the 'bytes' data is available in metadata
      if (fileData.containsKey('bytes') && fileData['bytes'] != null) {
        return Align(
          alignment:
              isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
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
                Text('File: ${fileData['name']}'),
                ElevatedButton(
                  onPressed: () {
                    downloadFileFromBytes(fileData['bytes'], fileData['name']);
                    // Download file logic for web using the bytes
                    // final blob = html.Blob([fileData['bytes']]);
                    // final url = html.Url.createObjectUrlFromBlob(blob);
                    // final anchor = html.AnchorElement(href: url)
                    //   ..setAttribute('download', fileData['name'])
                    //   ..click();
                    // html.Url.revokeObjectUrl(url);
                  },
                  child: const Text('Download File'),
                ),
              ],
            ),
          ),
        );
      } else {
        return const Text('File data is not available for download.');
      }
    } else if (!kIsWeb) {
      // Native platform file handling
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
              Text('File: ${fileMessage.name}'),
              ElevatedButton(
                onPressed: () {
                  // Native file open/download handling
                  File file = File(fileMessage.uri);
                  // Add logic to open the file or handle it as needed
                },
                child: const Text('Open File'),
              ),
            ],
          ),
        ),
      );
    }
    return Container();
  }
}
