import 'package:flutter/material.dart';
import 'package:freelance_app/models/job_model.dart';
import 'package:freelance_app/views/job_details_post.dart';
import 'package:freelance_app/widgets/job_post.dart';
import 'package:freelance_app/widgets/post_a_job_card.dart';
import 'package:freelance_app/widgets/services_container.dart';

class WallPage extends StatelessWidget {
  const WallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const PostAJobCard(),
          const SizedBox(height: 5),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const ServicesForYou(),
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
                                  JobDetailsPost(job: jobs[index]),
                            ),
                          );
                        },
                        child: JobPost(
                          job: jobs[index],
                          isPostDetailed: false,
                        ),
                      );
                    },
                    itemCount: jobs.length,
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

// dah kolo hytmsah hygy mn l db

final List<JobModel> jobs = [
  JobModel(
      title: 'Mobile App Development',
      description: 'Build a cross-platform mobile application using Flutter.',
      budget: '1000',
      tags: ['Flutter', 'Mobile Development', 'Dart'],
      location: 'Remote',
      duration: '1 month',
      noOfPropsals: 15,
      jobType: 'Hourly',
      clientName: 'John Mark'),
  JobModel(
      title: 'Write an SEO Article',
      description:
          'Write a 1000-word article focused on SEO for a tech blog.Write a 1000-word article focused on SEO for a tech blog.Write a 1000-word article focused on SEO for a tech blog.Write a 1000-word article focused on SEO for a tech blog.Write a 1000-word article focused on SEO for a tech blog.Write a 1000-word article focused on SEO for a tech blog.',
      budget: '150',
      tags: ['SEO', 'Content Writing', 'Blog'],
      location: 'United States',
      duration: '1 week',
      noOfPropsals: 5,
      jobType: 'Fixed',
      clientName: 'Alex Atlas'),
  JobModel(
      title: 'Website Redesign',
      description: 'Redesign a company website with a modern UI/UX.',
      budget: '2000',
      tags: ['Web Design', 'UI/UX', 'HTML/CSS'],
      location: 'Germany',
      duration: '2 months',
      noOfPropsals: 8,
      jobType: 'Fixed',
      clientName: 'John Mark'),
  JobModel(
      title: 'Graphic Designer for Marketing Materials',
      description: 'Design brochures, banners, and other marketing materials.',
      budget: '500',
      tags: ['Graphic Design', 'Marketing', 'Photoshop'],
      location: 'Canada',
      duration: '3 weeks',
      noOfPropsals: 3,
      jobType: 'Hourly',
      clientName: 'John Mark'),
  JobModel(
      title: 'Backend Developer for API Integration',
      description:
          'Integrate third-party APIs into an existing backend system.',
      budget: '1200',
      tags: ['API', 'Backend Development', 'Node.js'],
      location: 'Remote',
      duration: '1 month',
      noOfPropsals: 10,
      jobType: 'Hourly',
      clientName: 'John Mark'),
  JobModel(
      title: 'E-commerce Platform Setup',
      description: 'Set up and customize an e-commerce platform using Shopify.',
      budget: '1500',
      tags: ['Shopify', 'E-commerce', 'Customization'],
      location: 'United Kingdom',
      duration: '1 month',
      noOfPropsals: 6,
      jobType: 'Fixed',
      clientName: 'John Mark'),
  JobModel(
      title: 'Video Editor for YouTube Channel',
      description: 'Edit and produce 5 YouTube videos per week.',
      budget: '300',
      tags: ['Video Editing', 'YouTube', 'Premiere Pro'],
      location: 'Remote',
      duration: 'Ongoing',
      noOfPropsals: 12,
      jobType: 'Hourly',
      clientName: 'John Mark'),
  JobModel(
      title: 'Logo Design for Startup',
      description: 'Design a creative and unique logo for a new startup.',
      budget: '100',
      tags: ['Logo Design', 'Graphic Design', 'Branding'],
      location: 'Australia',
      duration: '1 week',
      noOfPropsals: 20,
      jobType: 'Fixed',
      clientName: 'John Mark'),
  JobModel(
      title: 'Social Media Manager',
      description:
          'Manage social media accounts and create content for marketing.',
      budget: '800',
      tags: ['Social Media', 'Marketing', 'Content Creation'],
      location: 'Remote',
      duration: '2 months',
      noOfPropsals: 7,
      jobType: 'Hourly',
      clientName: 'John Mark'),
  JobModel(
      title: 'Translation of Legal Documents',
      description: 'Translate legal documents from English to Spanish.',
      budget: '400',
      tags: ['Translation', 'Legal', 'Spanish'],
      location: 'Mexico',
      duration: '1 week',
      noOfPropsals: 4,
      jobType: 'Fixed',
      clientName: 'John Mark'),
];
