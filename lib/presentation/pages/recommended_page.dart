import 'package:flutter/material.dart';
import 'package:job_tracker/presentation/widgets/app_bar_builder.dart';
import 'package:job_tracker/presentation/widgets/job_card.dart';
import '../widgets/bottom_navigation.dart';

class RecommendedPage extends StatelessWidget {
  const RecommendedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery
        .of(context)
        .size
        .width;

    return Scaffold(
      appBar: AppBarBuilder(title: 'Recommended'),
      bottomNavigationBar: const BottomNavigation(currentIndex: 0),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: 10,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 20,
            childAspectRatio: 1.1,
          ),
          itemBuilder: (context, index) {
            return JobCard(
              companyLogo: 'https://example.com/logos/google.png',
              companyName: 'Spotify',
              role: 'Project manager',
              location: 'Dubai, UAE',
              jobType: 'Full Time',
              applicants: 23,

              views: 784,
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (_) => JobDetailPage(job: job)),
                    },
            );
          },
        ),
      ),
    );
  }
}
