import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:job_tracker/data/models/bookmarked_job.dart';
import 'package:job_tracker/presentation/pages/job_detail_page.dart';
import 'package:job_tracker/presentation/widgets/app_bar_builder.dart';
import 'package:job_tracker/presentation/widgets/bottom_navigation.dart';
import 'package:job_tracker/presentation/widgets/job_card_date.dart';
import 'package:job_tracker/presentation/widgets/no_result.dart';
import '../../core/config/design_config.dart';
import '../providers/job_provider.dart';

class RecentlyJobPage extends ConsumerWidget {
  const RecentlyJobPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recentJobs = ref.watch(recentJobsProvider);
    final design = DesignConfig.current;

    return Scaffold(
      appBar: AppBarBuilder(title: 'Recently Job Opening'),
      bottomNavigationBar: const BottomNavigation(currentIndex: 0),
      backgroundColor: design.backgroundColor,
      body: recentJobs.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (jobs) {
          if (jobs.isEmpty) {
            return const NoResult(
              image: 'assets/images/no_job.png',
              text: 'There are no jobs',
            );
          }

          final sortedJobs = jobs.toList()
            ..sort((a, b) => b.publishedDate.compareTo(a.publishedDate));

          return ListView.builder(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            itemCount: sortedJobs.length,
            itemBuilder: (_, i) {
              final job = sortedJobs[i];
              final isSaved = BookmarkedJobs.contains(job);

              return JobCardDate(
                companyName: job.companyName,
                role: job.role,
                location: job.location,
                jobType: job.jobType,
                description: job.description,
                applicants: job.applicants,
                views: job.views,
                date: job.publishedDate,
                companyLogo: job.companyLogo,
                isBookmarked: isSaved,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => JobDetailPage(job: job),
                    ),
                  );
                },
                onIcon: () {
                  if (isSaved) {
                    BookmarkedJobs.remove(job);
                  } else {
                    BookmarkedJobs.add(job);
                  }
                  ref.invalidate(recentJobsProvider);
                },
              );
            },
          );
        },
      ),
    );
  }
}
