// ignore_for_file: prefer_const_constructors
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
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

// ========== Freelancer Skills and languages ============
List<String> skills = [
  "UI/UX",
  "Java",
  'Kotlin',
  'Java Script',
  'python',
  'dart',
  'angular',
  'mongo',
  'C++',
  'C',
  'Mobile app',
  'Flutter',
  'Android',
  'odoo',
];

List<String> languages = ["Arabic", "Englisch", "Germany", "Frensch"];

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
