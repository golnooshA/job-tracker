import 'package:flutter/material.dart';
import 'package:job_tracker/core/config/design_config.dart';
import 'package:job_tracker/presentation/widgets/app_bar_builder.dart';
import 'package:job_tracker/presentation/widgets/job_card.dart';

class RecommendedPage extends StatelessWidget {
  const RecommendedPage({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBarBuilder(title: 'Recommended'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child:  GridView.builder(
          shrinkWrap: true,
          itemCount: 10,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 20,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            return JobCard(
              companyLogo: 'assets/images/banner_1.png',
              companyName: 'Spotify',
              role: 'Project manager',
              location: 'Dubai, UAE',
              jobType: 'Full Time',
              applicants: 23,
              views: 784,
              onTap: () {},
            );
          },
        ),
      ),
    );
  }
}
