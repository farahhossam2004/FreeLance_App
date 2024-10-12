import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freelance_app/helpers/helpers.dart';
import 'package:freelance_app/main.dart';
import 'package:freelance_app/models/chat_converstaion.dart';
import 'package:freelance_app/models/free_lancer.dart';
import 'package:freelance_app/services/client_provider.dart';
import 'package:freelance_app/views/chat_screen.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:provider/provider.dart';

class ChatsInboxScreen extends StatelessWidget {
  const ChatsInboxScreen({super.key, required this.conversations});
  final List<ChatConverstaion> conversations;

  @override
  Widget build(BuildContext context) {
    final currentUserEmail = Provider.of<ClientProvider>(context).email;
    final userProvider = Provider.of<ClientProvider>(context, listen: false);
    // print(currentUserEmail);
    return Column(
      children: [
        const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Inbox',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            )),
        Expanded(
            child: StreamBuilder(
                stream: userProvider.role == 'free_lancer'
                    ? FirebaseFirestore.instance
                        .collection('Users')
                        .where('role', isEqualTo: 'client')
                        .snapshots()
                    : FirebaseFirestore.instance
                        .collection('Users')
                        .where('role', isEqualTo: 'free_lancer')
                        .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (!snapshot.hasData ||
                      snapshot.data?.docs.isEmpty == true) {
                    return const Center(child: Text('No Chats found.'));
                  }
                  final usersChats = snapshot.data!.docs;

                  return ListView.builder(
                    itemCount: usersChats.length,
                    itemBuilder: (context, index) {
                      final otherUserChatData =
                          usersChats[index].data() as Map<String, dynamic>;
                      final otherUserChatEmail = otherUserChatData['email'];
                      final otherUserChatName = otherUserChatData['full_name'];

                      return ListTile(
                        title: Text(otherUserChatName),
                        subtitle: Text('Start the conversation'),
                        onTap: () {
                          _navigateToChatScreen(context, currentUserEmail!,
                              otherUserChatEmail, otherUserChatName);
                          // _startConversation(
                          //     context, currentUserEmail!, freelancerEmail);
                        },
                      );
                    },
                  );
                  // final conversations = snapshot.data?.docs ?? [];

                  // return ListView.builder(
                  //     itemCount: conversations.length,
                  //     itemBuilder: (context, index) {
                  //       final conv =
                  //           conversations[index].data() as Map<String, dynamic>;
                  //       final user = types.User(
                  //           id: conv['freelancerId'] ?? conv['clientId'],
                  //           firstName: 'User');
                  //       return Padding(
                  //         padding: const EdgeInsets.symmetric(
                  //             horizontal: 8, vertical: 4),
                  //         child: Container(
                  //           decoration: BoxDecoration(
                  //               color: Colors.white,
                  //               borderRadius: BorderRadius.circular(12),
                  //               boxShadow: [
                  //                 BoxShadow(
                  //                     color: Colors.grey.withOpacity(0.2),
                  //                     spreadRadius: 1,
                  //                     blurRadius: 5,
                  //                     offset: const Offset(0, 2))
                  //               ]),
                  //           child: ListTile(
                  //             contentPadding: const EdgeInsets.all(16),
                  //             tileColor: Colors.grey[300],
                  //             leading: CircleAvatar(
                  //                 // backgroundImage: AssetImage(conv.userAvatar),
                  //                 ),
                  //             title: Text(user.firstName ?? 'Unknown'),
                  //             subtitle: Text(conv['lastMessage'] ?? ''),
                  //             onTap: () {
                  //               Navigator.push(
                  //                   context,
                  //                   MaterialPageRoute(
                  //                       builder: (context) => ChatScreen(
                  //                             user: user,
                  //                             conversationId:
                  //                                 conversations[index].id,
                  //                           )));
                  //             },
                  //           ),
                  //         ),
                  //       );
                  //     });
                })),
      ],
    );
  }

  // Function to navigate to ChatScreen with the freelancer
  Future<void> _navigateToChatScreen(BuildContext context, String mainUserEmail,
      String otherUserEmail, String otherUserName) async {
    final userProvider = Provider.of<ClientProvider>(context, listen: false);
    String userRole = userProvider.role.toString();
    // Check if a conversation between the client and freelancer exists
    final conversationRef =
        FirebaseFirestore.instance.collection('Chat-Conversations');

    final conversationSnapshot = await conversationRef
        .where('clientId',
            isEqualTo: userRole == 'client' ? mainUserEmail : otherUserEmail)
        .where('freelancerId', isEqualTo: userRole == 'free_lancer' ? mainUserEmail :  otherUserEmail)
        .get();

    String conversationId;

    if (conversationSnapshot.docs.isEmpty) {
      // No existing conversation, create a new one
      DocumentReference newConversation = await conversationRef.add({
        'clientId': userRole == 'client' ? mainUserEmail : otherUserEmail,
        'freelancerId': userRole == 'free_lancer' ? mainUserEmail :  otherUserEmail,
        'lastMessage': '', // No last message yet
        'lastMessageAt': DateTime.now(),
      });
      conversationId = newConversation.id;
    } else {
      // Use existing conversation
      conversationId = conversationSnapshot.docs.first.id;
    }

    // Navigate to ChatScreen with the freelancer and conversationId
    final otherUser = types.User(id: otherUserEmail, firstName: otherUserName);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatScreen(
          user: otherUser,
          conversationId: conversationId,
          userRole: userRole,
        ),
      ),
    );
  }
}

// Function to create a new conversation or navigate to existing one
// Future<void> _startConversation(
//     BuildContext context, String clientEmail, String freelancerEmail) async {
//   // Check if a conversation already exists
//   final conversationRef =
//       FirebaseFirestore.instance.collection('Chat-Conversations');

//   final conversationSnapshot = await conversationRef
//       .where('clientId', isEqualTo: clientEmail)
//       .where('freelancerId', isEqualTo: freelancerEmail)
//       .get();

//   String conversationId;
//   if (conversationSnapshot.docs.isEmpty) {
//     // If no conversation exists, create a new one
//     DocumentReference newConversation = await conversationRef.add({
//       'clientId': clientEmail,
//       'freelancerId': freelancerEmail,
//       'lastMessage': '', // No last message yet
//       'lastMessageAt': DateTime.now(),
//     });
//     conversationId = newConversation.id;
//   } else {
//     // If conversation exists, use its ID
//     conversationId = conversationSnapshot.docs.first.id;
//   }

//   // Navigate to the chat screen
//   final freelancerUser =
//       types.User(id: freelancerEmail, firstName: 'Freelancer');
//   Navigator.push(
//     context,
//     MaterialPageRoute(
//       builder: (context) => ChatScreen(
//         user: freelancerUser,
//         conversationId: conversationId,
//       ),
//     ),
//   );
// }
