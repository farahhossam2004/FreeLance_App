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
// List<String> skills = [
//   "UI/UX",
//   "Java",
//   'Kotlin',
//   'Java Script',
//   'python',
//   'dart',
//   'angular',
//   'mongo',
//   'C++',
//   'C',
//   'Mobile app',
//   'Flutter',
//   'Android',
//   'odoo',
// ];

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

Map<String, List<String>> freelancerJobTitlesAndSkilss = {
  "Graphic Designer": [
    "Adobe Photoshop",
    "Adobe Illustrator",
    "CorelDRAW",
    "InDesign",
    "UI/UX Design",
    "Brand Identity",
    "Print Design",
    "Typography",
    "Color Theory",
    "Sketch"
  ],
  "Web Developer": [
    "HTML",
    "CSS",
    "JavaScript",
    "React",
    "Node.js",
    "PHP",
    "Ruby on Rails",
    "SQL",
    "Version Control (Git)",
    "Responsive Design"
  ],
  "Content Writer": [
    "SEO Writing",
    "Copywriting",
    "Research Skills",
    "Editing and Proofreading",
    "Storytelling",
    "Content Management Systems (CMS)",
    "Social Media Content Creation",
    "Audience Research",
    "Technical Writing",
    "Email Marketing"
  ],
  "Copywriter": [
    "Creativity",
    "Persuasive Writing",
    "Research Skills",
    "SEO Knowledge",
    "Brand Voice Development",
    "Editing and Proofreading",
    "Time Management",
    "Understanding of Marketing",
    "Adaptability",
    "Attention to Detail"
  ],
  "Digital Marketer": [
    "Google Analytics",
    "SEO/SEM",
    "Content Marketing",
    "Social Media Marketing",
    "Email Marketing",
    "PPC Advertising",
    "Conversion Rate Optimization",
    "Market Research",
    "Brand Strategy",
    "Customer Segmentation"
  ],
  "Social Media Manager": [
    "Content Creation",
    "Social Media Platforms",
    "Community Management",
    "Analytics and Reporting",
    "Social Media Advertising",
    "Graphic Design",
    "Copywriting",
    "Trend Analysis",
    "Influencer Collaboration",
    "Crisis Management"
  ],
  "SEO Specialist": [
    "Keyword Research",
    "On-Page SEO",
    "Off-Page SEO",
    "Technical SEO",
    "Google Analytics",
    "SEO Tools (e.g., SEMrush, Moz)",
    "Link Building",
    "Content Optimization",
    "Competitor Analysis",
    "Reporting"
  ],
  "Mobile App Developer": [
    "Swift (iOS)",
    "Java/Kotlin (Android)",
    "React Native",
    "Flutter",
    "UI/UX Design",
    "API Integration",
    "Version Control (Git)",
    "Debugging",
    "Agile Methodologies",
    "Database Management"
  ],
  "Video Editor": [
    "Adobe Premiere Pro",
    "Final Cut Pro",
    "DaVinci Resolve",
    "Video Production",
    "Color Grading",
    "Sound Editing",
    "Storyboarding",
    "Animation",
    "Script Writing",
    "Project Management"
  ],
  "UX/UI Designer": [
    "User Research",
    "Wireframing",
    "Prototyping",
    "Usability Testing",
    "Adobe XD",
    "Figma",
    "Sketch",
    "HTML/CSS Basics",
    "User-Centered Design",
    "Design Systems"
  ],
  "Translator": [
    "Fluency in Source and Target Languages",
    "Cultural Awareness",
    "Attention to Detail",
    "Research Skills",
    "CAT Tools (e.g., SDL Trados)",
    "Proofreading",
    "Editing",
    "Time Management",
    "Specialized Vocabulary",
    "Contextual Understanding"
  ],
  "Virtual Assistant": [
    "Organizational Skills",
    "Communication Skills",
    "Time Management",
    "Customer Service",
    "Data Entry",
    "Social Media Management",
    "Calendar Management",
    "Basic Accounting",
    "Project Management",
    "Research Skills"
  ],
  "Photographer": [
    "Camera Operation",
    "Photo Editing (e.g., Adobe Lightroom)",
    "Lighting Techniques",
    "Composition Skills",
    "Portrait Photography",
    "Event Photography",
    "Product Photography",
    "Real Estate Photography",
    "Photo Retouching",
    "Creativity"
  ],
  "Data Analyst": [
    "Statistical Analysis",
    "Data Visualization",
    "SQL",
    "Excel",
    "Python/R",
    "Data Cleaning",
    "Machine Learning Basics",
    "Reporting",
    "Problem Solving",
    "Attention to Detail"
  ],
  "Software Engineer": [
    "Programming Languages (e.g., Java, C++, Python)",
    "Software Development Life Cycle (SDLC)",
    "Version Control (Git)",
    "Database Management",
    "Debugging",
    "Problem-Solving Skills",
    "API Development",
    "Agile Methodologies",
    "Testing and QA",
    "Documentation"
  ],
  "Voice Over Artist": [
    "Voice Modulation",
    "Pronunciation",
    "Script Reading",
    "Audio Editing",
    "Character Voices",
    "Improv Skills",
    "Storytelling",
    "Pacing",
    "Microphone Techniques",
    "Emotional Range"
  ],
  "Motion Graphics Designer": [
    "Adobe After Effects",
    "Animation Techniques",
    "Storyboarding",
    "Video Editing",
    "Graphic Design",
    "3D Animation Basics",
    "Visual Effects",
    "Sound Editing",
    "Creativity",
    "Project Management"
  ],
  "Financial Consultant": [
    "Financial Analysis",
    "Budgeting",
    "Forecasting",
    "Investment Strategies",
    "Risk Management",
    "Regulatory Knowledge",
    "Tax Planning",
    "Client Communication",
    "Data Interpretation",
    "Attention to Detail"
  ],
  "Project Manager": [
    "Project Planning",
    "Risk Management",
    "Budget Management",
    "Stakeholder Communication",
    "Agile Methodologies",
    "Time Management",
    "Leadership",
    "Problem Solving",
    "Documentation",
    "Negotiation"
  ],
  "Customer Support Specialist": [
    "Communication Skills",
    "Problem-Solving Skills",
    "Technical Proficiency",
    "Time Management",
    "Customer Relationship Management (CRM)",
    "Conflict Resolution",
    "Attention to Detail",
    "Empathy",
    "Product Knowledge",
    "Multitasking"
  ],
  "Product Manager": [
    "Market Research",
    "Product Lifecycle Management",
    "Stakeholder Communication",
    "Agile Methodologies",
    "Data Analysis",
    "Strategic Planning",
    "User-Centered Design",
    "Roadmap Development",
    "Problem Solving",
    "Leadership"
  ],
  "Marketing Consultant": [
    "Market Research",
    "Brand Development",
    "Social Media Strategy",
    "SEO/SEM",
    "Data Analysis",
    "Content Strategy",
    "Email Marketing",
    "Campaign Management",
    "Networking",
    "Public Relations"
  ],
  "Email Marketer": [
    "Email Marketing Tools (e.g., Mailchimp)",
    "Copywriting",
    "Segmentation",
    "A/B Testing",
    "Analytics",
    "Automation",
    "CRM Integration",
    "List Building",
    "Campaign Management",
    "Compliance (e.g., GDPR)"
  ],
  "Brand Strategist": [
    "Brand Development",
    "Market Research",
    "Competitive Analysis",
    "Brand Messaging",
    "Content Strategy",
    "Social Media Strategy",
    "Project Management",
    "Creativity",
    "Analytics",
    "Collaboration"
  ],
  "Business Analyst": [
    "Data Analysis",
    "Business Process Modeling",
    "Requirements Gathering",
    "Stakeholder Communication",
    "SQL",
    "Problem-Solving Skills",
    "Documentation",
    "Project Management",
    "Technical Knowledge",
    "Change Management"
  ],
  "Blockchain Developer": [
    "Blockchain Fundamentals",
    "Smart Contracts (e.g., Solidity)",
    "Cryptography",
    "Distributed Ledger Technology",
    "Web3 Development",
    "API Development",
    "Data Structures",
    "Problem Solving",
    "Agile Methodologies",
    "Security Best Practices"
  ],
  "Illustrator": [
    "Adobe Illustrator",
    "Creativity",
    "Typography",
    "Color Theory",
    "Vector Graphics",
    "Print Design",
    "Brand Identity",
    "Digital Illustration",
    "Artistic Skills",
    "Attention to Detail"
  ],
  "Technical Writer": [
    "Technical Writing Skills",
    "Research Skills",
    "Editing and Proofreading",
    "Documentation Tools (e.g., MadCap Flare)",
    "Content Management Systems (CMS)",
    "Attention to Detail",
    "User-Centered Design",
    "Project Management",
    "Creativity",
    "Technical Knowledge"
  ],
  "E-commerce Specialist": [
    "E-commerce Platforms (e.g., Shopify, WooCommerce)",
    "Digital Marketing",
    "SEO",
    "Content Creation",
    "Inventory Management",
    "Customer Service",
    "Data Analysis",
    "Payment Gateway Integration",
    "Social Media Marketing",
    "Analytics"
  ],
  "Sales Consultant": [
    "Sales Techniques",
    "Negotiation Skills",
    "Customer Relationship Management (CRM)",
    "Market Research",
    "Product Knowledge",
    "Networking",
    "Time Management",
    "Communication Skills",
    "Problem Solving",
    "Goal Setting"
  ],
  "IT Support Specialist": [
    "Troubleshooting",
    "Networking",
    "Operating Systems (Windows, Mac, Linux)",
    "Customer Service",
    "Help Desk Software",
    "Remote Support Tools",
    "Documentation",
    "Attention to Detail",
    "Problem Solving",
    "Time Management"
  ],
  "Legal Consultant": [
    "Legal Research",
    "Contract Review",
    "Compliance Knowledge",
    "Negotiation Skills",
    "Writing Legal Documents",
    "Communication Skills",
    "Analytical Skills",
    "Understanding of Regulations",
    "Attention to Detail",
    "Client Management"
  ],
  "Public Relations Specialist": [
    "Media Relations",
    "Communication Skills",
    "Crisis Management",
    "Content Creation",
    "Event Planning",
    "Social Media Management",
    "Research Skills",
    "Brand Strategy",
    "Networking",
    "Project Management"
  ],
  "Online Tutor": [
    "Subject Matter Expertise",
    "Communication Skills",
    "Lesson Planning",
    "Online Teaching Tools",
    "Patience",
    "Feedback and Assessment",
    "Time Management",
    "Motivational Skills",
    "Adaptability",
    "Technology Proficiency"
  ],
  "Cybersecurity Consultant": [
    "Risk Assessment",
    "Network Security",
    "Incident Response",
    "Penetration Testing",
    "Compliance Knowledge",
    "Security Tools",
    "Data Encryption",
    "Security Awareness Training",
    "Technical Writing",
    "Problem Solving"
  ],
  "Resume Writer": [
    "Resume Formatting",
    "Content Creation",
    "Keyword Optimization",
    "Attention to Detail",
    "Research Skills",
    "Industry Knowledge",
    "Editing and Proofreading",
    "Client Communication",
    "Creativity",
    "Understanding of ATS"
  ],
  "CAD Designer": [
    "CAD Software (e.g., AutoCAD, SolidWorks)",
    "3D Modeling",
    "Technical Drawing",
    "Attention to Detail",
    "Problem Solving",
    "Collaboration Skills",
    "Engineering Principles",
    "Time Management",
    "Creativity",
    "Project Management"
  ],
  "Event Planner": [
    "Organizational Skills",
    "Budget Management",
    "Communication Skills",
    "Vendor Management",
    "Creativity",
    "Time Management",
    "Negotiation Skills",
    "Attention to Detail",
    "Problem Solving",
    "Marketing Skills"
  ],
  "Podcast Editor": [
    "Audio Editing (e.g., Adobe Audition)",
    "Sound Design",
    "Understanding of Audio Formats",
    "Communication Skills",
    "Attention to Detail",
    "Creative Thinking",
    "Time Management",
    "Project Management",
    "Storytelling",
    "Technical Knowledge"
  ],
  "AI/ML Specialist": [
    "Machine Learning Algorithms",
    "Python/R",
    "Data Analysis",
    "Statistical Analysis",
    "Deep Learning Frameworks (e.g., TensorFlow, PyTorch)",
    "Data Preprocessing",
    "Model Evaluation",
    "Cloud Services (e.g., AWS, Azure)",
    "Problem Solving",
    "Research Skills"
  ],
  "Accountant": [
    "Financial Reporting",
    "Tax Preparation",
    "Budgeting",
    "Excel",
    "Accounting Software (e.g., QuickBooks)",
    "Regulatory Knowledge",
    "Attention to Detail",
    "Analytical Skills",
    "Problem Solving",
    "Client Communication"
  ],
  "Game Developer": [
    "Game Design",
    "Programming Languages (e.g., C#, C++)",
    "Game Engines (e.g., Unity, Unreal Engine)",
    "3D Modeling",
    "Storytelling",
    "Version Control (Git)",
    "Problem Solving",
    "Creativity",
    "User Interface Design",
    "Team Collaboration"
  ],
  "Interior Designer": [
    "Space Planning",
    "Color Theory",
    "AutoCAD",
    "3D Modeling Software",
    "Knowledge of Materials",
    "Communication Skills",
    "Attention to Detail",
    "Project Management",
    "Creativity",
    "Client Relationship Management"
  ],
  "Personal Trainer": [
    "Fitness Knowledge",
    "Nutrition Knowledge",
    "Motivational Skills",
    "Communication Skills",
    "Program Design",
    "Client Assessment",
    "Time Management",
    "Adaptability",
    "Sales Skills",
    "Understanding of Safety Protocols"
  ],
  "Market Researcher": [
    "Data Analysis",
    "Survey Design",
    "Market Trend Analysis",
    "Statistical Software (e.g., SPSS, SAS)",
    "Communication Skills",
    "Report Writing",
    "Attention to Detail",
    "Critical Thinking",
    "Project Management",
    "Presentation Skills"
  ],
  "Cloud Computing Specialist": [
    "Cloud Services (e.g., AWS, Azure, Google Cloud)",
    "Networking",
    "Security",
    "Database Management",
    "DevOps Practices",
    "Technical Writing",
    "Problem Solving",
    "Cost Management",
    "Virtualization",
    "Monitoring and Performance Tuning"
  ],
  "Life Coach": [
    "Listening Skills",
    "Communication Skills",
    "Motivational Skills",
    "Goal Setting",
    "Empathy",
    "Problem Solving",
    "Time Management",
    "Conflict Resolution",
    "Knowledge of Coaching Techniques",
    "Adaptability"
  ],
  "Health and Wellness Coach": [
    "Nutrition Knowledge",
    "Fitness Knowledge",
    "Communication Skills",
    "Motivational Skills",
    "Program Design",
    "Client Assessment",
    "Time Management",
    "Understanding of Health Protocols",
    "Empathy",
    "Adaptability"
  ],
  "Recruitment Consultant": [
    "Interviewing Skills",
    "Negotiation Skills",
    "Market Knowledge",
    "Networking Skills",
    "Research Skills",
    "Communication Skills",
    "Time Management",
    "Analytical Skills",
    "Client Relationship Management",
    "Attention to Detail"
  ],
  "Scriptwriter": [
    "Creativity",
    "Storytelling",
    "Character Development",
    "Dialogue Writing",
    "Research Skills",
    "Editing",
    "Understanding of Script Formatting",
    "Collaboration Skills",
    "Time Management",
    "Adaptability"
  ]
};
