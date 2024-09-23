import 'package:flutter/material.dart';
import 'package:freelance_app/views/post_a_job.dart';

class PostAJobCard extends StatelessWidget {
  const PostAJobCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(232, 237, 244, 232),
      elevation: 0,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Need anything specific?',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Post Jobs according to your needs.',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w200,
                        color: Color.fromARGB(255, 55, 48, 48)),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PostAJobScreen()));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
              child: const Text('Post a Job'),
            )
          ],
        ),
      ),
    );
  }
}
