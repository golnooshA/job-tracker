import 'package:sqflite/sqflite.dart';
import 'dart:convert';

Future<void> seedInitialData(Database db) async {
  final categories = [
    {'name': 'Design', 'icon': 'design_services'},
    {'name': 'Developer', 'icon': 'code'},
    {'name': 'Network', 'icon': 'network_wifi'},
    {'name': 'Quality', 'icon': 'verified'},
    {'name': 'Marketing', 'icon': 'campaign'},
    {'name': 'Secretary', 'icon': 'person'},
    {'name': 'Analysis', 'icon': 'analytics'},
    {'name': 'Finance', 'icon': 'account_balance'},
    {'name': 'Product', 'icon': 'production_quantity_limits'},
    {'name': 'Support', 'icon': 'support_agent'},

  ];

  for (final cat in categories) {
    await db.insert('categories', cat);
  }

  final companies = [
    {
      'name': 'Spotify',
      'logo':
          'https://storage.googleapis.com/pr-newsroom-wp/1/2023/05/Spotify_Primary_Logo_RGB_Green.png',
      'about':
          'Spotify is a global leader in music streaming, offering personalized listening experiences for millions of users. With a mission to unlock the potential of human creativity, Spotify empowers artists and creators to share their work with the world.',
      'address': 'Dubai, UAE',
      'facility': 'Remote work, Health insurance',
      'size': '500+',
      'specialization': 'Music & Technology',
    },
    {
      'name': 'Dribbble',
      'logo':
          'https://cdn.freebiesupply.com/logos/large/2x/dribbble-icon-1-logo-png-transparent.png',
      'about':
          'Dribbble is the go-to platform for designers and creatives to showcase their work, connect with peers, and find exciting job opportunities. It fosters a vibrant community of professionals pushing the boundaries of visual creativity.',
      'address': 'New York, USA',
      'facility': 'Flexible Hours, Gym Membership',
      'size': '200+',
      'specialization': 'Design & Creative',
    },
    {
      'name': 'Slack',
      'logo': 'https://cdn-icons-png.flaticon.com/512/2584/2584687.png',
      'about':
          'Slack is a leading collaboration hub that transforms the way teams communicate. Designed to replace email, Slack offers organized channels, real-time messaging, and integration with hundreds of tools to streamline work.',
      'address': 'San Francisco, USA',
      'facility': 'Stock Options, Paid Time Off',
      'size': '1000+',
      'specialization': 'Team Communication',
    },
    {
      'name': 'Stripe',
      'logo':
          'https://logos-world.net/wp-content/uploads/2021/03/Stripe-Emblem.png',
      'about':
          'Stripe builds economic infrastructure for the internet. From startups to large enterprises, Stripe powers online payments, subscriptions, and global commerce through robust developer-friendly APIs.',
      'address': 'Dublin, Ireland',
      'facility': 'Global Remote, Health & Dental',
      'size': '1500+',
      'specialization': 'Fintech & Payments',
    },
    {
      'name': 'Canva',
      'logo':
          'https://images-eds-ssl.xboxlive.com/image?url=4rt9.lXDC4H_93laV1_eHHFT949fUipzkiFOBH3fAiZZUCdYojwUyX2aTonS1aIwMrx6NUIsHfUHSLzjGJFxxo4K81Ei7WzcnqEk8W.MgwZZ56XyKy_7p2TyTciCS4kEj5AU2j68Wg9XuMvu4y8vBTQ7HYavlg2F2ruYXW6hR6o-&format=source',
      'about':
          'Canva is a design platform that makes it easy for anyone to create beautiful visual content. Whether you are a marketer, teacher, or startup, Canva provides powerful tools to design everything from social media posts to presentations.',
      'address': 'Sydney, Australia',
      'facility': 'Free Meals, Design Tools Access',
      'size': '800+',
      'specialization': 'Design & SaaS',
    },
  ];

  for (final company in companies) {
    await db.insert('companies', company);
  }


  final jobs = [
    {
      'companyId': 1,
      'categoryId': 2,
      'role': 'Project Manager',
      'location': 'Dubai, UAE',
      'jobType': 'Full Time',
      'jobLink': 'https://www.lifeatspotify.com/jobs/agency-partner-japan-6-month-contract',
      'applicants': 23,
      'views': 784,
      'publishedDate': 'July 28, 2025',
      'description': 'Oversee projects from inception to completion, ensuring timely delivery, budget control, and team coordination.',
      'skills': jsonEncode([
        'Project Management',
        'Agile/Scrum',
        'Communication',
      ]),
      'companyAbout': 'Spotify is a global leader in music streaming, offering personalized listening experiences for millions of users. With a mission to unlock the potential of human creativity, Spotify empowers artists and creators to share their work with the world.',


    },
    {
      'companyId': 2,
      'categoryId': 1,
      'role': 'UI/UX Designer',
      'location': 'New York, USA',
      'jobType': 'Remote',
      'jobLink': 'https://dribbble.com/jobs/222494-Product-Designer-in-UX-UI-w-m-d?source=index',
      'applicants': 12,
      'views': 456,
      'publishedDate': 'July 28, 2025',
      'description': 'Design user-friendly interfaces and improve user experience for our mobile and web platforms.',
      'skills': jsonEncode([
        'Figma',
        'Sketch',
        'Adobe XD',
        'User Research',
      ]),
      'companyAbout': 'Dribbble is the go-to platform for designers and creatives to showcase their work, connect with peers, and find exciting job opportunities. It fosters a vibrant community of professionals pushing the boundaries of visual creativity.',

    },
    {
      'companyId': 3,
      'categoryId': 2,
      'role': 'Flutter Developer',
      'location': 'San Francisco, USA',
      'jobType': 'Remote',
      'jobLink': 'https://salesforce.wd12.myworkdayjobs.com/Slack/job/Ireland---Dublin/Business-Development-Representative---German-Speaking-Markets_JR304346-1',
      'applicants': 30,
      'views': 920,
      'publishedDate': 'July 27, 2025',
      'description': 'Develop and maintain high-quality mobile apps using Flutter and Dart.',
      'skills': jsonEncode([
        'Flutter',
        'Dart',
        'REST APIs',
        'State Management',
      ]),
      'companyAbout': 'Slack is a leading collaboration hub that transforms the way teams communicate. Designed to replace email, Slack offers organized channels, real-time messaging, and integration with hundreds of tools to streamline work.',

    },
    {
      'companyId': 4,
      'categoryId': 8,
      'role': 'Financial Analyst',
      'location': 'Dublin, Ireland',
      'jobType': 'Full Time',
      'jobLink': 'https://stripe.com/jobs/listing/account-executive-enterprise/7099651',
      'applicants': 18,
      'views': 638,
      'publishedDate': 'July 27, 2025',
      'description': 'Analyze financial data and create models for forecasting and decision making.',
      'skills': jsonEncode([
        'Excel',
        'SQL',
        'Financial Modeling',
      ]),
      'companyAbout': 'Stripe builds economic infrastructure for the internet. From startups to large enterprises, Stripe powers online payments, subscriptions, and global commerce through robust developer-friendly APIs.',

    },
    {
      'companyId': 5,
      'categoryId': 1,
      'role': 'Visual Designer',
      'location': 'Sydney, Australia',
      'jobType': 'Contract',
      'jobLink': 'https://stripe.com/jobs/listing/account-executive-enterprise/7099651',
      'applicants': 45,
      'views': 1023,
      'publishedDate': 'July 27, 2025',
      'description': 'Create visually appealing assets and maintain consistent branding across all channels.',
      'skills': jsonEncode([
        'Photoshop',
        'Illustrator',
        'Branding',
      ]),
      'companyAbout': 'Canva is a design platform that makes it easy for anyone to create beautiful visual content. Whether you are a marketer, teacher, or startup, Canva provides powerful tools to design everything from social media posts to presentations.',

    },
    {
      'companyId': 3,
      'categoryId': 10,
      'role': 'Customer Success Manager',
      'location': 'Remote',
      'jobType': 'Full Time',
      'jobLink': 'https://stripe.com/jobs/listing/account-executive-enterprise/7099651',
      'applicants': 21,
      'views': 712,
      'publishedDate': 'July 26, 2025',
      'description': 'Support and retain customers through proactive communication and issue resolution.',
      'skills': jsonEncode([
        'Customer Relationship Management',
        'Problem Solving',
        'SaaS Knowledge',
      ]),
      'companyAbout': 'Slack is a leading collaboration hub that transforms the way teams communicate. Designed to replace email, Slack offers organized channels, real-time messaging, and integration with hundreds of tools to streamline work.',

    },
    {
      'companyId': 3,
      'categoryId': 1,
      'role': 'Product Design',
      'location': 'Rome, italy',
      'jobType': 'Full Time',
      'jobLink': 'https://stripe.com/jobs/listing/account-executive-enterprise/7099651',
      'applicants': 34,
      'views': 567,
      'publishedDate': 'July 30, 2025',
      'description': 'Support and retain customers through proactive communication and issue resolution.',
      'skills': jsonEncode([
        'Figma, Adobe XD',
        'Web/Mobile design',
        'Problem Solving',
        'SaaS Knowledge',
      ]),
      'companyAbout': 'Slack is a leading collaboration hub that transforms the way teams communicate. Designed to replace email, Slack offers organized channels, real-time messaging, and integration with hundreds of tools to streamline work.',

    },
    {
      'companyId': 1,
      'categoryId': 4,
      'role': 'Google Marketing',
      'location': 'Milan, italy',
      'jobType': 'Part Time',
      'jobLink': 'https://stripe.com/jobs/listing/account-executive-enterprise/7099651',
      'applicants': 14,
      'views': 164,
      'publishedDate': 'July 30, 2025',
      'description': 'Support and retain customers through proactive communication and issue resolution.Support and retain customers through proactive communication and issue resolution.',
      'skills': jsonEncode([
        'Google ads',
        'Data Analysis',
      ]),
      'companyAbout': 'Strip is a leading collaboration hub that transforms the way teams communicate. Designed to replace email, Slack offers organized channels, real-time messaging, and integration with hundreds of tools to streamline work.',

    },
  ];


  for (final job in jobs) {
    await db.insert('jobs', job);
  }
}
