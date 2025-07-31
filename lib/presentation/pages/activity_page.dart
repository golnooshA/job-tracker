import 'package:flutter/material.dart';
import 'package:job_tracker/presentation/widgets/no_result.dart';
import '../../core/config/design_config.dart';
import '../../data/models/applied_jobs.dart';
import '../../data/models/bookmarked_job.dart';
import '../widgets/app_bar_builder.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/job_card_date.dart';
import 'job_detail_page.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final design = DesignConfig.current;

    return Scaffold(
        appBar: AppBarBuilder(title: 'Activity'),
        backgroundColor: design.backgroundColor,
        bottomNavigationBar: const BottomNavigation(currentIndex: 3),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TabBar(
                  controller: _tabController,
                  indicatorColor: design.primaryColor,
                  labelColor: design.primaryColor,
                  unselectedLabelColor: design.darkGrayColor,
                  indicatorWeight: 2.5,
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelStyle: TextStyle(
                    fontWeight: design.semiBold,
                    fontFamily: design.fontFamily,
                    fontSize: design.subTextFontSize,
                  ),
                  tabs: const [
                    Tab(text: 'Applied'),
                    Tab(text: 'Saved'),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildAppliedTab(),
                    _buildSavedTab(),
                  ],
                ),
              ),
            ],
          ),
        )
    );
    }

  Widget _buildAppliedTab() {
    final jobs = AppliedJobs.items;
    if (jobs.isEmpty) {
      return const NoResult(
        image: 'assets/images/no_job.png',
        text: 'There are no jobs',
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: jobs.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (_, index) {
        final job = jobs[index];
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
          showBookmark: true,
          isBookmarked: BookmarkedJobs.contains(job),
          onIcon: () {
            setState(() {
              if (BookmarkedJobs.contains(job)) {
                BookmarkedJobs.remove(job);
              } else {
                BookmarkedJobs.add(job);
              }
            });
          },
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => JobDetailPage(job: job),
              ),
            );
            setState(() {});
          },
        );
      },
    );
  }

  Widget _buildSavedTab() {
    final jobs = BookmarkedJobs.items;
    if (jobs.isEmpty) {
      return const NoResult(
        image: 'assets/images/no_job.png',
        text: 'There are no jobs',
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: jobs.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (_, index) {
        final job = jobs[index];
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
          showBookmark: true,
          isBookmarked: true,
          onIcon: () {
            setState(() {
              BookmarkedJobs.remove(job);
            });
          },
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => JobDetailPage(job: job),
              ),
            );
            setState(() {});
          },
        );
      },
    );
  }
}
