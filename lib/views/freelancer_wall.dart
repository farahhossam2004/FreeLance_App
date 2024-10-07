import 'package:flutter/material.dart';
import 'package:freelance_app/views/job_details_post.dart';
import 'package:freelance_app/widgets/job_post.dart';
import 'package:freelance_app/widgets/searchbar.dart';
import 'package:freelance_app/services/array_data_for_test.dart';
import 'package:freelance_app/widgets/services_container.dart';

class FreelancerWall extends StatefulWidget {
  const FreelancerWall({super.key});

  @override
  State<FreelancerWall> createState() => _FreelancerWallState();
}

class _FreelancerWallState extends State<FreelancerWall> {
  final TextEditingController _searchController = TextEditingController();
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredJobs = jobs.where((job) {
      return job.title.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      body: Column(
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
                  mainRole == 'Client'
                      ? const ServicesForYou()
                      : const SizedBox.shrink(),
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
                    physics:
                        const NeverScrollableScrollPhysics(), // Disable internal scrolling for ListView
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
      ),
    );
  }
}
