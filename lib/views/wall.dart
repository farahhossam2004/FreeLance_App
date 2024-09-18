import 'package:flutter/material.dart';
import 'package:freelance_app/models/job_model.dart';
import 'package:freelance_app/widgets/job_post.dart';

class WallPage extends StatelessWidget {
  WallPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemBuilder: (context, index) {
              return JobPost(job: jobs[index]);
            },
            itemCount: jobs.length,
          )),
          const SizedBox(
            height: 6,
          ),
        ],
    );
  }




  final List<JobModel> jobs = [
    JobModel(
    title: 'Mobile App Development',
    description: 'Build a cross-platform mobile application using Flutter.',
    budget: '1000',
    date: 'Sept 18, 2024',
    tags: ['Flutter', 'Mobile Development', 'Dart'],
    location: 'Remote',
    duration: '1 month',
    noOfPropsals: 15,
    isVerified: true,
    jobType: 'Hourly',
  ),
  JobModel(
    title: 'Write an SEO Article',
    description: 'Write a 1000-word article focused on SEO for a tech blog.',
    budget: '150',
    date: 'Sept 17, 2024',
    tags: ['SEO', 'Content Writing', 'Blog'],
    location: 'United States',
    duration: '1 week',
    noOfPropsals: 5,
    isVerified: true,
    jobType: 'Fixed',
  ),
  JobModel(
    title: 'Website Redesign',
    description: 'Redesign a company website with a modern UI/UX.',
    budget: '2000',
    date: 'Sept 15, 2024',
    tags: ['Web Design', 'UI/UX', 'HTML/CSS'],
    location: 'Germany',
    duration: '2 months',
    noOfPropsals: 8,
    isVerified: false,
    jobType: 'Fixed',
  ),
  JobModel(
    title: 'Graphic Designer for Marketing Materials',
    description: 'Design brochures, banners, and other marketing materials.',
    budget: '500',
    date: 'Sept 10, 2024',
    tags: ['Graphic Design', 'Marketing', 'Photoshop'],
    location: 'Canada',
    duration: '3 weeks',
    noOfPropsals: 3,
    isVerified: true,
    jobType: 'Hourly',
  ),
  JobModel(
    title: 'Backend Developer for API Integration',
    description: 'Integrate third-party APIs into an existing backend system.',
    budget: '1200',
    date: 'Sept 8, 2024',
    tags: ['API', 'Backend Development', 'Node.js'],
    location: 'Remote',
    duration: '1 month',
    noOfPropsals: 10,
    isVerified: true,
    jobType: 'Hourly',
  ),
  JobModel(
    title: 'E-commerce Platform Setup',
    description: 'Set up and customize an e-commerce platform using Shopify.',
    budget: '1500',
    date: 'Sept 12, 2024',
    tags: ['Shopify', 'E-commerce', 'Customization'],
    location: 'United Kingdom',
    duration: '1 month',
    noOfPropsals: 6,
    isVerified: false,
    jobType: 'Fixed',
  ),
  JobModel(
    title: 'Video Editor for YouTube Channel',
    description: 'Edit and produce 5 YouTube videos per week.',
    budget: '300',
    date: 'Sept 16, 2024',
    tags: ['Video Editing', 'YouTube', 'Premiere Pro'],
    location: 'Remote',
    duration: 'Ongoing',
    noOfPropsals: 12,
    isVerified: true,
    jobType: 'Hourly',
  ),
  JobModel(
    title: 'Logo Design for Startup',
    description: 'Design a creative and unique logo for a new startup.',
    budget: '100',
    date: 'Sept 14, 2024',
    tags: ['Logo Design', 'Graphic Design', 'Branding'],
    location: 'Australia',
    duration: '1 week',
    noOfPropsals: 20,
    isVerified: true,
    jobType: 'Fixed',
  ),
  JobModel(
    title: 'Social Media Manager',
    description: 'Manage social media accounts and create content for marketing.',
    budget: '800',
    date: 'Sept 13, 2024',
    tags: ['Social Media', 'Marketing', 'Content Creation'],
    location: 'Remote',
    duration: '2 months',
    noOfPropsals: 7,
    isVerified: false,
    jobType: 'Hourly',
  ),
  JobModel(
    title: 'Translation of Legal Documents',
    description: 'Translate legal documents from English to Spanish.',
    budget: '400',
    date: 'Sept 9, 2024',
    tags: ['Translation', 'Legal', 'Spanish'],
    location: 'Mexico',
    duration: '1 week',
    noOfPropsals: 4,
    isVerified: true,
    jobType: 'Fixed',
  ),
  ];
}