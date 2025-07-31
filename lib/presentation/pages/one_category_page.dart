import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:job_tracker/core/config/design_config.dart';
import 'package:job_tracker/data/models/bookmarked_job.dart';
import 'package:job_tracker/presentation/widgets/app_bar_builder.dart';
import 'package:job_tracker/presentation/widgets/bottom_navigation.dart';
import 'package:job_tracker/presentation/widgets/job_card_date.dart';
import 'package:job_tracker/presentation/widgets/no_result.dart';
import 'package:job_tracker/presentation/pages/job_detail_page.dart';
import '../providers/job_provider.dart';

class OneCategoryPage extends ConsumerWidget {
  final int categoryId;
  final String categoryName;

  const OneCategoryPage({
    super.key,
    required this.categoryId,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final design = DesignConfig.current;
    final jobsInCategory = ref.watch(jobsByCategoryProvider(categoryId));

    return Scaffold(
      backgroundColor: design.backgroundColor,
      appBar: AppBarBuilder(title: categoryName),
      bottomNavigationBar: const BottomNavigation(currentIndex: 0),
      body: jobsInCategory.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
          child: Text("Error: $e", style: TextStyle(color: design.errorColor)),
        ),
        data: (jobs) {
          if (jobs.isEmpty) {
            return const NoResult(
              image: 'assets/images/no_job.png',
              text: 'There are no jobs',
            );
          }

          final sortedJobs = jobs.toList()
            ..sort((a, b) => b.publishedDate.compareTo(a.publishedDate));

          return SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
                  child: Text(
                    "${sortedJobs.length} Jobs Found",
                    style: TextStyle(
                      fontFamily: design.fontFamily,
                      fontSize: design.subTextFontSize,
                      color: design.textColor,
                      fontWeight: design.semiBold,
                    ),
                  ),
                ),
                // const SizedBox(height: 8),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                    itemCount: sortedJobs.length,
                    itemBuilder: (_, i) {
                      final job = sortedJobs[i];
                      final isSaved = BookmarkedJobs.contains(job);

                      return JobCardDate(
                        companyName: job.companyName,
                        companyLogo: job.companyLogo,
                        role: job.role,
                        location: job.location,
                        jobType: job.jobType,
                        description: job.role,
                        applicants: job.applicants,
                        views: job.views,
                        date: job.publishedDate,
                        isBookmarked: isSaved,
                        showBookmark: true,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => JobDetailPage(job: job),
                          ),
                        ),
                        onIcon: () {
                          if (isSaved) {
                            BookmarkedJobs.remove(job);
                          } else {
                            BookmarkedJobs.add(job);
                          }
                          ref.invalidate(jobsByCategoryProvider(categoryId));
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
