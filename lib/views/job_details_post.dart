import 'package:flutter/material.dart';
import 'package:freelance_app/models/job_model.dart';
import 'package:freelance_app/services/user_provider.dart';
import 'package:freelance_app/views/chats_inbox_screen.dart';
import 'package:freelance_app/widgets/job_post.dart';
import 'package:provider/provider.dart';

class JobDetailsPost extends StatelessWidget {
  const JobDetailsPost({super.key, required this.job});
  final JobModel job;
    

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          job.title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            JobPost(
              job: job,
              isPostDetailed: true,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Flexible(
              //   flex: 1,
              //   child: ElevatedButton(
              //     onPressed: () {},
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: Colors.green,
              //       padding: const EdgeInsets.symmetric(vertical: 12.0),
              //     ),
              //     // child: const Row(
              //     //   mainAxisAlignment: MainAxisAlignment.center,
              //     //   children: [
              //     //     Text(
              //     //       'Send a Proposal',
              //     //       style: TextStyle(
              //     //         fontWeight: FontWeight.bold,
              //     //         color: Colors.white,
              //     //         fontSize: 12,
              //     //       ),
              //     //     ),
              //     //     SizedBox(
              //     //       width: 5,
              //     //     ),
              //     //     Icon(
              //     //       Icons.send,
              //     //       color: Colors.white,
              //     //       size: 12,
              //     //     ),
              //     //   ],
              //     // ),
              //   ),
              // ),
              const SizedBox(width: 10),
              Flexible(
                flex: 1,
                child: ElevatedButton(
                  onPressed: () async{
                    final currentUserEmail = Provider.of<UserProvider>(context, listen: false).email;
                    await ChatsInboxScreen.navigateToChatScreen(
                                    context,
                                    currentUserEmail!, 
                                    job.clientEmail, 
                                    job.clientName 
                                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Contact the client',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(
                        Icons.chat_bubble_outline,
                        color: Color.fromARGB(255, 255, 255, 255),
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
