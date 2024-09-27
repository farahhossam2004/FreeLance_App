import 'package:flutter/material.dart';
import 'package:freelance_app/views/job_details_post.dart';
import 'package:freelance_app/widgets/job_post.dart';
import 'package:freelance_app/widgets/post_a_job_card.dart';
import 'package:freelance_app/widgets/searchbar.dart';
import 'package:freelance_app/widgets/services_container.dart';
import 'package:freelance_app/services/array_data_for_test.dart';

class WallPage extends StatefulWidget {
  const WallPage({super.key});

  @override
  State<WallPage> createState() => _WallPageState();
}

class _WallPageState extends State<WallPage> {
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
          // if freelancer then view search bar
          mainRole == 'FreeLancer' ? CustomSearchBar(
            controller: _searchController,
            onSearchChanged: (value) {
              setState(() {
                searchQuery = value;
              });
            },
          ) : const SizedBox.shrink(),

          // if client view post job and services 
          mainRole == 'Client' ? const PostAJobCard() : const SizedBox.shrink(),

          const SizedBox(height: 5),
          
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  mainRole == 'Client' ? const ServicesForYou() : const SizedBox.shrink(),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                  ),
                  // Job posts list
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
                    itemCount:filteredJobs.length,
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
