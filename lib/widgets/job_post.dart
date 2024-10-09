import 'package:flutter/material.dart';
import 'package:freelance_app/models/job_model.dart';

class JobPost extends StatelessWidget {
  const JobPost({super.key, required this.job, required this.isPostDetailed});
  final JobModel job;
  final bool isPostDetailed;

  @override
  Widget build(BuildContext context) {
    return Card(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    
                  },
                  child: const CircleAvatar(
                    backgroundImage: AssetImage('assets/profile.jpeg'),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  job.clientName,
                  style: const TextStyle(
                    fontSize: 18, 
                    fontWeight: FontWeight.w300,
                    color: Colors.black54,
                    letterSpacing: 1.0,
                    fontFamily: 'Roboto',
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
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
                        maxLines: isPostDetailed
                            ? null
                            : 2, // Set maxLines to null if detailed
                        overflow: isPostDetailed
                            ? null
                            : TextOverflow.ellipsis, // No overflow if detailed
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Row(
                        children: [
                          Text(
                            'DD/MM/YYYY',
                            style: TextStyle(
                              color: Color.fromARGB(255, 100, 95, 95),
                            ),
                          ),
                          SizedBox(width: 4),
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
                      color: Color.fromARGB(255, 40, 122, 41),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
              ],
            ),
            const SizedBox(height: 12),
            if (isPostDetailed)
              Text(
                job.description,
                style: const TextStyle(
                  color: Color.fromARGB(255, 103, 99, 99),
                  fontSize: 16,
                ),
              ),
            const SizedBox(height: 12),
            // Tags (Skills)
            Wrap(
              runSpacing: 4,
              spacing: 8,
              children: job.tags.map((tag) {
                return Chip(
                  label: Text(
                    tag!,
                    style: const TextStyle(
                        color: Colors.orange, fontWeight: FontWeight.bold),
                  ),
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Colors.orange, width: 1),
                  ),
                  elevation: 3,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
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
                      Text(
                        job.location,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 100, 95, 95)),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      const Icon(Icons.description,
                          size: 16, color: Color.fromARGB(255, 100, 95, 95)),
                      const SizedBox(width: 4),
                      Text('Proposals: ${job.noOfPropsals}',
                          style: const TextStyle(
                              color: Color.fromARGB(255, 100, 95, 95))),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Time Remaining
            Row(
              children: [
                const Icon(Icons.access_time,
                    size: 16, color: Color.fromARGB(255, 100, 95, 95)),
                const SizedBox(width: 4),
                Text(
                  job.duration,
                  style:
                      const TextStyle(color: Color.fromARGB(255, 100, 95, 95)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
