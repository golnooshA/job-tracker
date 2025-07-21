import 'package:flutter/material.dart';
import 'package:job_tracker/presentation/pages/activity_page.dart';
import 'package:job_tracker/presentation/pages/companies_page.dart';
import 'package:job_tracker/presentation/pages/profile_page.dart';


void main() {
  runApp(const JobApp());
}

class JobApp extends StatelessWidget {
  const JobApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Job App UI',
      debugShowCheckedModeBanner: false,
      home: const ProfilePage(),
    );
  }
}