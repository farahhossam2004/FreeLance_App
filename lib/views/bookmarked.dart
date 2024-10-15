import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freelance_app/models/job_model.dart';
import 'package:freelance_app/services/user_provider.dart';
import 'package:freelance_app/views/job_details_post.dart';
import 'package:freelance_app/widgets/job_post.dart';
import 'package:provider/provider.dart';

class BookmarkedJobsPage extends StatefulWidget {
  const BookmarkedJobsPage({super.key});

  @override
  State<BookmarkedJobsPage> createState() => _BookmarkedJobsPageState();
}

class _BookmarkedJobsPageState extends State<BookmarkedJobsPage> {
  List<JobModel> savedJobs = [];

  @override
  void initState() {
    super.initState();
    _fetchSavedPosts(); // Fetch saved posts when the widget is initialized
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Saved Posts',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        savedJobs.isEmpty ? Expanded(child: const Center(child: Text('No saved posts found.'))) :
        Expanded(
          child: ListView.builder(
                itemCount: savedJobs.length,
                itemBuilder: (context, index) {
                  final job = savedJobs[index];
                  return GestureDetector(
                    onTap: () {
                      // Navigate to the job details page when tapped
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => JobDetailsPost(job: job),
                        ),
                      );
                    },
                    child: JobPost(job: job, isPostDetailed: false),
                  );
                },
              ),
        ),
      ],
    );
  }

  Future<void> _fetchSavedPosts() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final freelancerEmail = userProvider.freelancer?.Email;

    if (freelancerEmail != null) {
      try {
        QuerySnapshot savedPostsSnapshot = await FirebaseFirestore.instance
            .collection('Saved-Posts')
            .where('freelancerEmail', isEqualTo: freelancerEmail)
            .get();

        List<String> savedPostIds = savedPostsSnapshot.docs
            .map((doc) => doc['postId'] as String)
            .toList();

        if (savedPostIds.isNotEmpty) {
          QuerySnapshot jobsSnapshot = await FirebaseFirestore.instance
              .collection('Jobs-Posts')
              .where(FieldPath.documentId, whereIn: savedPostIds)
              .get();

          savedJobs = jobsSnapshot.docs.map((doc) {
            final data = doc.data() as Map<String, dynamic>;
            return JobModel(
              id: doc.id, // Firestore document ID
              title: data['title'] ?? '',
              description: data['description'] ?? '',
              budget: data['budget'] ?? '',
              tags: List<String>.from(data['tags'] ?? []),
              location: data['location'] ?? '',
              duration: data['duration'] ?? '',
              jobType: data['jobType'] ?? '',
              clientName: data['clientName'] ?? '',
              time: data['time'] ?? '',
              clientEmail: data['clientEmail'] ?? '',
            );
          }).toList();
        }

        if (mounted) {
        setState(() {}); // Update the state to reflect the fetched saved jobs
      } 
      } catch (e) {
        print("Error fetching saved posts: $e");
      }
    }
  }
}
