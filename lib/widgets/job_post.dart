import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freelance_app/models/job_model.dart';
import 'package:freelance_app/services/user_provider.dart';
import 'package:freelance_app/views/other_client_profile.dart';
import 'package:provider/provider.dart';

class JobPost extends StatefulWidget {
  const JobPost({super.key, required this.job, required this.isPostDetailed});
  final JobModel job;
  final bool isPostDetailed;

  @override
  State<JobPost> createState() => _JobPostState();
}


class _JobPostState extends State<JobPost> {
   bool isSaved = false; // Track whether the post is saved

  @override
  void initState() {
    super.initState();
    _checkIfSaved(); // Check if the post is saved when the widget is initialized
  }
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                OtherClientProfile(email: widget.job.clientEmail)));
                  },
                  child: const CircleAvatar(
                    backgroundImage: AssetImage('assets/profile.jpeg'),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  widget.job.clientName,
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
                        widget.job.title,
                        maxLines: widget.isPostDetailed
                            ? null
                            : 2, // Set maxLines to null if detailed
                        overflow: widget.isPostDetailed
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
                  icon: Icon(
                    isSaved ? Icons.bookmark : Icons.bookmark_add_outlined, // Change icon based on save status
                    color: isSaved ? const Color.fromARGB(255, 72, 82, 65) : Colors.grey,
                  ),
                  onPressed: _toggleSavePost,),
              ],
            ),
            const SizedBox(height: 12),
            // Price and Job Type
            Row(
              children: [
                Expanded(
                  child: Text(
                    '\$${widget.job.budget}',
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
            if (widget.isPostDetailed)
              Text(
                widget.job.description,
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
              children: widget.job.tags.map((tag) {
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
                        widget.job.location,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 100, 95, 95)),
                      ),
                    ],
                  ),
                ),
                // Expanded(
                //   child: Row(
                //     children: [
                //       const Icon(Icons.description,
                //           size: 16, color: Color.fromARGB(255, 100, 95, 95)),
                //       const SizedBox(width: 4),
                //       Text('Proposals: ${widget.job.noOfPropsals}',
                //           style: const TextStyle(
                //               color: Color.fromARGB(255, 100, 95, 95))),
                //     ],
                //   ),
                // ),
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
                  widget.job.duration,
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

  Future<void> _checkIfSaved() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final freelancerEmail = userProvider.freelancer?.Email;

    if (freelancerEmail != null) {
      // Check if this post is already saved by the freelancer
      QuerySnapshot result = await FirebaseFirestore.instance
          .collection('Saved-Posts')
          .where('postId', isEqualTo: widget.job.id)
          .where('freelancerEmail', isEqualTo: freelancerEmail)
          .get();

      if (result.docs.isNotEmpty) {
        setState(() {
          isSaved = true; // Post is already saved
        });
      }
    }
  }

  Future<void> _toggleSavePost() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final freelancerEmail = userProvider.freelancer?.Email;

    if (freelancerEmail != null) {
      if (isSaved) {
        // Unsave the post
        QuerySnapshot result = await FirebaseFirestore.instance
            .collection('Saved-Posts')
            .where('postId', isEqualTo: widget.job.id)
            .where('freelancerEmail', isEqualTo: freelancerEmail)
            .get();

        if (result.docs.isNotEmpty) {
          await result.docs.first.reference.delete();
        }

        setState(() {
          isSaved = false; // Update the state to reflect the post is unsaved
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Post unsaved!')),
        );
      } else {
        // Save the post
        await FirebaseFirestore.instance.collection('Saved-Posts').add({
          'postId': widget.job.id, 
          'freelancerEmail': freelancerEmail,
          'savedAt': Timestamp.now(),
        });

        setState(() {
          isSaved = true; // Update the state to reflect the post is saved
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Post saved!')),
        );
      }
    }
  }
}
