import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freelance_app/models/job_model.dart';
import 'package:freelance_app/services/user_provider.dart';
import 'package:freelance_app/views/job_details_post.dart';
import 'package:freelance_app/widgets/job_post.dart';
import 'package:provider/provider.dart';

class ClientJobsScreen extends StatefulWidget {
  const ClientJobsScreen({super.key});

  @override
  State<ClientJobsScreen> createState() => _ClientJobsScreenState();
}

class _ClientJobsScreenState extends State<ClientJobsScreen> {
  List<JobModel> jobs = [];

  @override
  void initState() {
    super.initState();

    fetchJobs();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 15,
        ),
        const Text(
          'My Posts',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final job = jobs[index];
                    return JobPost(
                      job: job,
                      isPostDetailed: false,
                    );
                  },
                  itemCount: jobs.length,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> fetchJobs() async {
    String clientEmail =
        Provider.of<UserProvider>(context, listen: false).email.toString();
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('Jobs-Posts')
          .where('clientEmail', isEqualTo: clientEmail)
          .get();

      jobs = snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return JobModel(
          title: data['title'] ?? '',
          description: data['description'] ?? '',
          budget: data['budget'] ?? '',
          tags: List<String>.from(data['tags'] ?? []) ?? [], // Handle tags
          location: data['location'] ?? '',
          duration: data['duration'] ?? '',
          jobType: data['jobType'] ?? '',
          clientName: data['clientName'] ?? '',
          time: data['time'] ?? '',
          clientEmail: data['clientEmail'] ?? '',
        );
      }).toList();

      setState(() {}); // Update the state to reflect the fetched jobs
    } catch (e) {
      print("Error fetching jobs: $e");
    }
  }
}
