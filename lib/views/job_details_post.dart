import 'package:flutter/material.dart';
import 'package:freelance_app/models/job_model.dart';
import 'package:freelance_app/widgets/job_post.dart';

class JobDetailsPost extends StatelessWidget {
  const JobDetailsPost({super.key, required this.job});
  final JobModel job;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(job.title,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ),
        body: Column(
          children: [
            JobPost(
              job: job,
              isPostDetailed: true,
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Send a Proposal', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),),
                  SizedBox(width: 8,),
                  Icon(Icons.send, color: Colors.white),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 246, 242, 242),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Contact the client', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.green),),
                  SizedBox(width: 8,),
                  Icon(Icons.contact_page, color: Colors.green),
                ],
              ),
            ),
          ],
        ));
  }
}
