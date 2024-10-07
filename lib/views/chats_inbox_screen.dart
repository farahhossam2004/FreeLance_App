import 'package:flutter/material.dart';
import 'package:freelance_app/models/chat_converstaion.dart';
import 'package:freelance_app/views/chat_screen.dart';

class ChatsInboxScreen extends StatelessWidget {
  const ChatsInboxScreen({super.key, required this.conversations});
  final List<ChatConverstaion> conversations;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Inbox',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            )),
        Expanded(
          child: ListView.builder(
              itemCount: conversations.length,
              itemBuilder: (context, index) {
                final conv = conversations[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 2)
                      )]
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      tileColor: Colors.grey[300],
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(conv.userAvatar),
                      ),
                      title: Text(conv.user.firstName.toString()),
                      subtitle: Text(conv.lastMessage),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChatScreen(user: conv.user)));
                      },
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
