// ignore_for_file: avoid_print, annotate_overrides, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freelance_app/models/job_model.dart';
import 'package:freelance_app/services/user_provider.dart';
import 'package:freelance_app/views/job_details_post.dart';
import 'package:freelance_app/widgets/job_post.dart';
import 'package:freelance_app/widgets/searchbar.dart';
import 'package:provider/provider.dart';

class FreelancerWall extends StatefulWidget {
  const FreelancerWall({super.key});

  @override
  State<FreelancerWall> createState() => _FreelancerWallState();
}

class _FreelancerWallState extends State<FreelancerWall> {
  final TextEditingController _searchController = TextEditingController();
  String searchQuery = '';
  List<JobModel> jobs = [];

  void initState() {
    super.initState();
    fetchJobs(); // Fetch jobs when the widget is initialized
  }

  Future<void> fetchJobs() async {
    try {
      // Fetch jobs from Firestore
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('Jobs-Posts').get();

      jobs = snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return JobModel(
          clientImage: data['clientImageURL'],
          id: doc.id,
          title: data['title'] ?? '',
          description: data['description'] ?? '',
          budget: data['budget'] ?? '',
          tags: List<String>.from(data['tags'] ?? []), // Handle tags
          location: data['location'] ?? '',
          duration: data['duration'] ?? '',
          jobType: data['jobType'] ?? '',
          clientName: data['clientName'] ?? '',
          time: data['time'] ?? '',
          clientEmail: data['clientEmail'] ?? '',
        );
      }).toList();

      if (mounted) {
        setState(() {});
      } // Update the state to reflect the fetched jobs
    } catch (e) {
      print("Error fetching jobs: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final freelancerProvider =
        Provider.of<UserProvider>(context, listen: false);
    final filteredJobs = jobs.where((job) {
      return job.title.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return Column(
      children: [
        CustomSearchBar(
          controller: _searchController,
          onSearchChanged: (value) {
            setState(() {
              searchQuery = value;
            });
          },
        ),
        const SizedBox(height: 5),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // mainRole == 'Client'
                //     ? const ServicesForYou()
                //     : const SizedBox.shrink(),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                ),

                ListView.builder(
                  shrinkWrap:
                      true, // Necessary to prevent infinite height error
                  physics: const NeverScrollableScrollPhysics(),
                  // Disable internal scrolling for ListView
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                JobDetailsPost(job: filteredJobs[index]),
                          ),
                        );
                      },
                      child: JobPost(
                        job: filteredJobs[index],
                        isPostDetailed: false,
                      ),
                    );
                  },
                  itemCount: filteredJobs.length,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
