
// ignore_for_file: prefer_const_constructors

import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:freelance_app/models/job_model.dart';
import 'package:freelance_app/models/chat_converstaion.dart';

String mainRole = 'FreeLancer';

// =========== job titles for freelancers and categories in client profile =======
List<String> freelancerJobTitles = [
    "Graphic Designer",
    "Web Developer",
    "Content Writer",
    "Copywriter",
    "Digital Marketer",
    "Social Media Manager",
    "SEO Specialist",
    "Mobile App Developer",
    "Video Editor",
    "UX/UI Designer",
    "Translator",
    "Virtual Assistant",
    "Photographer",
    "Data Analyst",
    "Software Engineer",
    "Voice Over Artist",
    "Motion Graphics Designer",
    "Financial Consultant",
    "Project Manager",
    "Customer Support Specialist",
    "Product Manager",
    "Marketing Consultant",
    "Email Marketer",
    "Brand Strategist",
    "Business Analyst",
    "Blockchain Developer",
    "Illustrator",
    "Technical Writer",
    "E-commerce Specialist",
    "Sales Consultant",
    "IT Support Specialist",
    "Legal Consultant",
    "Public Relations Specialist",
    "Online Tutor",
    "Cybersecurity Consultant",
    "Resume Writer",
    "CAD Designer",
    "Event Planner",
    "Podcast Editor",
    "AI/ML Specialist",
    "Accountant",
    "Game Developer",
    "Interior Designer",
    "Personal Trainer",
    "Market Researcher",
    "Cloud Computing Specialist",
    "Life Coach",
    "Health and Wellness Coach",
    "Recruitment Consultant",
    "Scriptwriter"
  ];

// ========== Inbox Massages ======
final conversations = [
  ChatConverstaion(
    user: types.User(id: '1', firstName: 'Alice'),
    userAvatar: 'assets/profile.jpeg',
    lastMessage: 'Hey! How are you?',
  ),
  ChatConverstaion(
    user: types.User(id: '2', firstName: 'Bob'),
    userAvatar: 'assets/profile.jpeg',
    lastMessage: 'Let’s catch up soon!',
  ),
  // Add more conversations as needed
];

//========== test user for chat =========
final types.User currentUser = types.User(
  id: 'user123',
  firstName: 'Alice',
  imageUrl: 'https://example.com/avatar.png',
);
//============= Top Rated Freelancers ============
final List<Map<String, dynamic>> freelancers = [
  {
    'name': 'Will Parker',
    'rating': 4.8,
    'image': 'assets/profile.jpeg',
    'bio':
        'An experienced web developer specializing in frontend technologies.',
  },
  {
    'name': 'Alan Robert',
    'rating': 4.2,
    'image': 'assets/profile.jpeg',
    'bio': 'A mobile app developer with a focus on iOS and Android.',
  },
  {
    'name': 'Ran Williams',
    'rating': 4.8,
    'image': 'assets/profile.jpeg',
    'bio': 'A UX/UI designer with a passion for user-centered design.',
  },
  {
    'name': 'Ran Williams',
    'rating': 4.8,
    'image': 'assets/profile.jpeg',
    'bio': 'A UX/UI designer with a passion for user-centered design.',
  },
  {
    'name': 'Ran Williams',
    'rating': 4.8,
    'image': 'assets/profile.jpeg',
    'bio': 'A UX/UI designer with a passion for user-centered design.',
  },
];

//============= LOCATION ==================
List<String> locationsList = [
  'Remotly',
  'Egypt',
  'Canada',
  'Germany',
  'France',
  'UK',
  'US',
  'United State of Emirates'
];

// ==================== Countries =================

List<String> countriesList = [
  'Egypt',
  'Canada',
  'Germany',
  'France',
  'UK',
  'US',
  'United State of Emirates'
];

// =================== Job Posts ===================

final List<JobModel> jobs = [];
//   JobModel(
//       title: 'Mobile App Development',
//       description: 'Build a cross-platform mobile application using Flutter.',
//       budget: '1000',
//       tags: ['Flutter', 'Mobile Development', 'Dart'],
//       location: 'Remote',
//       duration: '1 month',
//       noOfPropsals: 15,
//       jobType: 'Hourly',
//       clientName: 'John Mark'),
//   JobModel(
//       title: 'Write an SEO Article',
//       description:
//           'Write a 1000-word article focused on SEO for a tech blog.Write a 1000-word article focused on SEO for a tech blog.Write a 1000-word article focused on SEO for a tech blog.Write a 1000-word article focused on SEO for a tech blog.Write a 1000-word article focused on SEO for a tech blog.Write a 1000-word article focused on SEO for a tech blog.',
//       budget: '150',
//       tags: ['SEO', 'Content Writing', 'Blog'],
//       location: 'United States',
//       duration: '1 week',
//       noOfPropsals: 5,
//       jobType: 'Fixed',
//       clientName: 'Alex Atlas'),
//   JobModel(
//       title: 'Website Redesign',
//       description: 'Redesign a company website with a modern UI/UX.',
//       budget: '2000',
//       tags: ['Web Design', 'UI/UX', 'HTML/CSS'],
//       location: 'Germany',
//       duration: '2 months',
//       noOfPropsals: 8,
//       jobType: 'Fixed',
//       clientName: 'John Mark'),
//   JobModel(
//       title: 'Graphic Designer for Marketing Materials',
//       description: 'Design brochures, banners, and other marketing materials.',
//       budget: '500',
//       tags: ['Graphic Design', 'Marketing', 'Photoshop'],
//       location: 'Canada',
//       duration: '3 weeks',
//       noOfPropsals: 3,
//       jobType: 'Hourly',
//       clientName: 'John Mark'),
//   JobModel(
//       title: 'Backend Developer for API Integration',
//       description:
//           'Integrate third-party APIs into an existing backend system.',
//       budget: '1200',
//       tags: ['API', 'Backend Development', 'Node.js'],
//       location: 'Remote',
//       duration: '1 month',
//       noOfPropsals: 10,
//       jobType: 'Hourly',
//       clientName: 'John Mark'),
//   JobModel(
//       title: 'E-commerce Platform Setup',
//       description: 'Set up and customize an e-commerce platform using Shopify.',
//       budget: '1500',
//       tags: ['Shopify', 'E-commerce', 'Customization'],
//       location: 'United Kingdom',
//       duration: '1 month',
//       noOfPropsals: 6,
//       jobType: 'Fixed',
//       clientName: 'John Mark'),
//   JobModel(
//       title: 'Video Editor for YouTube Channel',
//       description: 'Edit and produce 5 YouTube videos per week.',
//       budget: '300',
//       tags: ['Video Editing', 'YouTube', 'Premiere Pro'],
//       location: 'Remote',
//       duration: 'Ongoing',
//       noOfPropsals: 12,
//       jobType: 'Hourly',
//       clientName: 'John Mark'),
//   JobModel(
//       title: 'Logo Design for Startup',
//       description: 'Design a creative and unique logo for a new startup.',
//       budget: '100',
//       tags: ['Logo Design', 'Graphic Design', 'Branding'],
//       location: 'Australia',
//       duration: '1 week',
//       noOfPropsals: 20,
//       jobType: 'Fixed',
//       clientName: 'John Mark'),
//   JobModel(
//       title: 'Social Media Manager',
//       description:
//           'Manage social media accounts and create content for marketing.',
//       budget: '800',
//       tags: ['Social Media', 'Marketing', 'Content Creation'],
//       location: 'Remote',
//       duration: '2 months',
//       noOfPropsals: 7,
//       jobType: 'Hourly',
//       clientName: 'John Mark'),
//   JobModel(
//       title: 'Translation of Legal Documents',
//       description: 'Translate legal documents from English to Spanish.',
//       budget: '400',
//       tags: ['Translation', 'Legal', 'Spanish'],
//       location: 'Mexico',
//       duration: '1 week',
//       noOfPropsals: 4,
//       jobType: 'Fixed',
//       clientName: 'John Mark'),
// ];

// ==================== Job Catgeories and sub categories and skills ======================

final Map<String, Map<String, List<String>>> jobCategories = {
  'Writing and Editing': {
    'Content Writing': [
      'SEO Content',
      'Article Writing',
      'Product Descriptions',
      'Web Content',
    ],
    'Copywriting': [
      'Sales Copy',
      'Ad Copy',
      'Email Copywriting',
      'Landing Page Copy',
    ],
    'Technical Writing': [
      'User Manuals',
      'White Papers',
      'API Documentation',
      'Technical Reports',
    ],
    'Blogging': [
      'Personal Blogging',
      'Business Blogging',
      'Guest Posts',
      'Niche Blogging',
    ],
    'Editing and Proofreading': [
      'Grammar Checking',
      'Content Rewriting',
      'Academic Editing',
      'Manuscript Editing',
    ],
  },
  'Graphic Design': {
    'Logo Design': [
      'Brand Identity',
      'Custom Logos',
      'Rebranding',
      'Typography Design',
    ],
    'Web Design': [
      'UI/UX Design',
      'Responsive Design',
      'Wireframing',
      'Website Redesign',
    ],
    'Print Design (Brochures, Business Cards)': [
      'Brochure Design',
      'Flyers and Posters',
      'Business Card Design',
      'Catalogs',
    ],
    'Infographics': [
      'Data Visualization',
      'Information Design',
      'Custom Icons',
      'Statistical Graphics',
    ],
  },
  'Web Development': {
    'Front-end Development': [
      'HTML/CSS',
      'JavaScript',
      'React.js',
      'Vue.js',
    ],
    'Back-end Development': [
      'Node.js',
      'Django',
      'Ruby on Rails',
      'PHP',
    ],
    'Full-stack Development': [
      'MERN Stack',
      'MEAN Stack',
      'LAMP Stack',
      'Web APIs',
    ],
    'WordPress Development': [
      'Theme Customization',
      'Plugin Development',
      'Site Migration',
      'WooCommerce',
    ],
  },
  'Digital Marketing': {
    'Social Media Management': [
      'Facebook Ads',
      'Instagram Growth',
      'Twitter Strategy',
      'LinkedIn Marketing',
    ],
    'SEO Consulting': [
      'On-Page SEO',
      'Off-Page SEO',
      'Keyword Research',
      'SEO Audits',
    ],
    'Email Marketing': [
      'MailChimp Campaigns',
      'Email Automation',
      'Newsletter Writing',
      'Lead Generation',
    ],
    'PPC Advertising': [
      'Google Ads',
      'Facebook Ads',
      'LinkedIn Ads',
      'YouTube Ads',
    ],
  },
  'Photography and Videography': {
    'Event Photography': [
      'Wedding Photography',
      'Corporate Events',
      'Private Parties',
      'Concert Photography',
    ],
    'Product Photography': [
      'E-commerce Photography',
      'Studio Photography',
      'Lifestyle Photography',
      'Food Photography',
    ],
    'Video Editing': [
      'Post-Production',
      'Video Montage',
      'Sound Design',
      'Color Grading',
    ],
    'Promotional Videos': [
      'Corporate Videos',
      'Explainer Videos',
      'Commercials',
      'Social Media Videos',
    ],
  },
  'Consulting': {
    'Business Consulting': [
      'Business Strategy',
      'Operations Consulting',
      'Growth Hacking',
      'Startup Consulting',
    ],
    'Financial Consulting': [
      'Financial Planning',
      'Investment Consulting',
      'Accounting Services',
      'Tax Consulting',
    ],
    'HR Consulting': [
      'Recruitment Strategies',
      'HR Audits',
      'Employee Training',
      'Compliance Consulting',
    ],
    'Marketing Consulting': [
      'Brand Strategy',
      'Market Research',
      'Content Strategy',
      'Product Launches',
    ],
  },
  'Virtual Assistance': {
    'Administrative Support': [
      'Scheduling',
      'Travel Arrangements',
      'Inbox Management',
      'Calendar Management',
    ],
    'Customer Service': [
      'Email Support',
      'Live Chat Support',
      'Ticketing Systems',
      'Phone Support',
    ],
    'Data Entry': [
      'Spreadsheet Management',
      'CRM Data Entry',
      'Transcription',
      'Database Maintenance',
    ],
    'Project Management': [
      'Task Coordination',
      'Team Communication',
      'Resource Allocation',
      'Deadline Management',
    ],
  },
  'IT and Software Development': {
    'Software Development': [
      'Java Development',
      'C++ Development',
      'Python Development',
      'Software Testing',
    ],
    'App Development': [
      'iOS Development',
      'Android Development',
      'Cross-Platform Apps',
      'Mobile UI/UX Design',
    ],
    'IT Support': [
      'Network Troubleshooting',
      'Hardware Setup',
      'Software Installation',
      'Help Desk Support',
    ],
    'Cybersecurity Consulting': [
      'Penetration Testing',
      'Vulnerability Assessment',
      'Compliance Auditing',
      'Incident Response',
    ],
  },
  'Translation and Transcription': {
    'Document Translation': [
      'Legal Translation',
      'Medical Translation',
      'Technical Translation',
      'Website Localization',
    ],
    'Audio Transcription': [
      'Interview Transcription',
      'Podcast Transcription',
      'Meeting Transcription',
      'Legal Transcription',
    ],
    'Subtitling': [
      'Movie Subtitling',
      'Video Subtitling',
      'Foreign Language Subtitles',
      'Captioning for the Deaf',
    ],
  },
  'Education and Tutoring': {
    'Online Tutoring': [
      'Math Tutoring',
      'Science Tutoring',
      'Language Tutoring',
      'Test Prep',
    ],
    'Course Creation': [
      'Curriculum Design',
      'E-learning Platforms',
      'Video Lectures',
      'Interactive Lessons',
    ],
    'Curriculum Development': [
      'K-12 Curriculum',
      'Higher Education Curriculum',
      'Homeschool Curriculum',
      'Corporate Training Curriculum',
    ],
  },
};
