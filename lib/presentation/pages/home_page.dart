import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:job_tracker/core/config/design_config.dart';
import 'package:job_tracker/data/models/bookmarked_job.dart';
import 'package:job_tracker/presentation/pages/categories_list_page.dart';
import 'package:job_tracker/presentation/pages/job_detail_page.dart';
import 'package:job_tracker/presentation/pages/notification_list_page.dart';
import 'package:job_tracker/presentation/pages/recent_job_page.dart';
import 'package:job_tracker/presentation/widgets/banner.dart';
import 'package:job_tracker/presentation/widgets/button_icon_category.dart';
import 'package:job_tracker/presentation/widgets/job_card_date.dart';
import 'package:job_tracker/presentation/widgets/title_section.dart';
import '../providers/category_provider.dart';
import '../providers/job_provider.dart';
import '../providers/notification_list_provider.dart';
import '../utils/icon_mapper.dart';
import '../widgets/bottom_navigation.dart';
import 'one_category_page.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final design = DesignConfig.current;

    final categories = ref.watch(allCategoriesProvider);
    final recentJobs = ref.watch(recentJobsProvider);
    final notificationCount = ref.watch(notificationListProvider).length;

    return Scaffold(
      bottomNavigationBar: const BottomNavigation(currentIndex: 0),
      backgroundColor: design.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello,",
                        style: TextStyle(
                          fontFamily: design.fontFamily,
                          fontSize: design.textFontSize,
                          fontWeight: design.light,
                          color: design.subTextColor,
                        ),
                      ),
                      Text(
                        "Jack Fisher",
                        style: TextStyle(
                          fontFamily: design.fontFamily,
                          fontSize: design.mediumFontSize,
                          fontWeight: design.semiBold,
                          color: design.textColor,
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.notifications_none),
                        color: design.darkGrayColor,
                        iconSize: 28,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const NotificationListPage(),
                            ),
                          );
                        },
                      ),
                      if (notificationCount > 0)
                        Positioned(
                          right: 6,
                          top: 6,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: design.errorColor,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              '$notificationCount',
                              style: TextStyle(
                                fontFamily: design.fontFamily,
                                fontSize: design.tinyFontSize,
                                fontWeight: design.semiBold,
                                color: design.buttonTextColor,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),

              // Banners
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    BannerCard(image: 'assets/images/banner_1.png'),
                    SizedBox(width: 10),
                    BannerCard(image: 'assets/images/banner_2.png'),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Categories
              categories.when(
                data: (data) {
                  final visibleCategories = data.length > 7
                      ? data.sublist(0, 7)
                      : data;
                  return GridView.builder(
                    shrinkWrap: true,
                    itemCount: visibleCategories.length + 1,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 1,
                    ),
                    itemBuilder: (context, index) {
                      if (index == visibleCategories.length) {
                        return ButtonIconCategory(
                          icon: Icons.more_horiz,
                          text: "More",
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const CategoriesListPage(),
                            ),
                          ),
                        );
                      }

                      final item = visibleCategories[index];
                      return ButtonIconCategory(
                        icon: getIconByName(item.iconName),
                        text: item.name,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => OneCategoryPage(
                              categoryId: item.id,
                              categoryName: item.name,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                loading: () => const CircularProgressIndicator(),
                error: (e, _) => Text("Error: $e", style: TextStyle(color: design.errorColor)),
              ),

              const SizedBox(height: 20),

              TitleSection(
                title: "Recently Job Opening",
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const RecentlyJobPage()),
                ),
              ),
              const SizedBox(height: 4),

              recentJobs.when(
                data: (data) {
                  final sortedJobs = data.toList()
                    ..sort(
                          (a, b) => b.publishedDate.compareTo(a.publishedDate),
                    );

                  return Column(
                    children: sortedJobs.map((job) {
                      final isBookmarked = BookmarkedJobs.contains(job);

                      return JobCardDate(
                        companyName: job.companyName,
                        companyLogo: job.companyLogo,
                        role: job.role,
                        location: job.location,
                        jobType: job.jobType,
                        description: job.description,
                        applicants: job.applicants,
                        views: job.views,
                        date: job.publishedDate,
                        isBookmarked: isBookmarked,
                        showBookmark: true,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => JobDetailPage(job: job),
                            ),
                          );
                        },
                        onIcon: () {
                          if (isBookmarked) {
                            BookmarkedJobs.remove(job);
                          } else {
                            BookmarkedJobs.add(job);
                          }
                          ref.invalidate(recentJobsProvider);
                        },
                      );
                    }).toList(),
                  );
                },
                loading: () => const CircularProgressIndicator(),
                error: (e, _) => Text("Error: $e", style: TextStyle(color: design.errorColor)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
