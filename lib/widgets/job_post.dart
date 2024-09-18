import 'package:flutter/material.dart';
import 'package:freelance_app/models/job_model.dart';
import 'package:freelance_app/views/job_details_post.dart';

class JobPost extends StatelessWidget {
  const JobPost({super.key, required this.job});
  final JobModel job;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => JobDetailsPost(job: job,)));
      },
      child: Expanded(
        child: Card(
          
          elevation: 4,
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Job Title, Date and Mandatory/Not Mandatory
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            job.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Text(
                                job.date,
                                style: const TextStyle(color: Color.fromARGB(255, 100, 95, 95)),
                              ),
                              const SizedBox(width: 4),
                            ],
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.bookmark_add_outlined,
                          color: Colors.grey),
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                // Price and Job Type
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        '\$${job.budget}',
                        style: const TextStyle(
                          color: Color.fromARGB(255, 24, 45, 51),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
                const SizedBox(height: 12),
                // Tags (Skills)
                Wrap(
                  runSpacing: 4,
                  spacing: 8,
                  children: job.tags.map((tag) {
                    return Chip(
                      label: Text(
                        tag,
                        style: const TextStyle(
                            color: Colors.orange, fontWeight: FontWeight.bold),
                      ),
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side:
                              const BorderSide(color: Colors.orange, width: 1)),
                      elevation: 3,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 12),
                // Location, Proposals, and Verified Info
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          const Icon(Icons.location_on,
                              size: 16, color: Color.fromARGB(255, 100, 95, 95)),
                          const SizedBox(width: 4),
                          Text(job.location,
                              style: const TextStyle(color: Color.fromARGB(255, 100, 95, 95)),
                      )],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          const Icon(Icons.description,
                              size: 16, color: Color.fromARGB(255, 100, 95, 95)),
                          const SizedBox(width: 4),
                          Text('Proposals: ${job.noOfPropsals}',
                              style: const TextStyle(color: Color.fromARGB(255, 100, 95, 95))),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                // Time Remaining
                Row(
                  children: [
                    const Icon(Icons.access_time, size: 16, color: Color.fromARGB(255, 100, 95, 95)),
                    const SizedBox(width: 4),
                    Text(job.duration,
                        style: const TextStyle(color: Color.fromARGB(255, 100, 95, 95))),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
