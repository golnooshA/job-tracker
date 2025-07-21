import 'package:flutter/material.dart';
import 'package:job_tracker/presentation/widgets/app_bar_builder.dart';
import 'package:job_tracker/presentation/widgets/job_card.dart';

import '../widgets/job_card_date.dart';

class RecentlyJobPage extends StatelessWidget {
  const RecentlyJobPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBuilder(title: 'Recently Job Opening'),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 10,
        itemBuilder: (_, i) {
          return JobCardDate(
            companyName: 'Dribble',
            role: 'Project manager',
            location: 'Dubai, UAE',
            jobType: 'Full time',
            description:
            'We are looking for Project Manager, you can apply here.\nGood multitask is a plus for this role.',
            applicants: 64,
            views: 344,
            date: 'Jun 29, 2025',
            companyLogo: 'assets/images/banner_1.png',
            isBookmarked: false,
            onTap: () {},
          );
        },
      ),
    );
  }
}
