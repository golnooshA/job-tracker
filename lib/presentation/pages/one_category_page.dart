import 'package:flutter/material.dart';
import 'package:job_tracker/presentation/widgets/app_bar_builder.dart';
import 'package:job_tracker/presentation/widgets/job_card_date.dart';

import '../../core/config/design_config.dart';

class OneCategoryPage extends StatelessWidget {
  const OneCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBuilder(title: 'Category Name'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding for spacing
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
            child: Text(
              "120 Jobs Found",
              style: const TextStyle(
                fontFamily: DesignConfig.fontFamily,
                fontSize: DesignConfig.subTextSize,
                color: DesignConfig.textColor,
                fontWeight: DesignConfig.semiBold,
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              itemCount: 10,
              itemBuilder: (_, i) => JobCardDate(
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
              ),
            ),
          )
        ],
      ),
    );
  }
}
