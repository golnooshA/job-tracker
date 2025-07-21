import 'package:flutter/material.dart';
import '../../core/config/design_config.dart';
import '../widgets/app_bar_builder.dart';
import '../widgets/job_card_date.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> with SingleTickerProviderStateMixin {
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
    return Scaffold(
      appBar: AppBarBuilder(title: 'Activity'),
      body: SafeArea(
        child: Column(
          children: [
            TabBar(
              controller: _tabController,
              indicatorColor: DesignConfig.primaryColor,
              labelColor: DesignConfig.primaryColor,
              unselectedLabelColor: DesignConfig.lightTextColor,
              indicatorWeight: 2.5,
              indicatorSize: TabBarIndicatorSize.tab,
              labelStyle: const TextStyle(
                fontWeight: DesignConfig.semiBold,
                fontFamily: DesignConfig.fontFamily,
                color: DesignConfig.lightTextColor,
                fontSize: DesignConfig.subTextSize,
              ),
              tabs: const [
                Tab(text: 'Applied'),
                Tab(text: 'Saved'),
              ],
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
      ),
    );
  }

  Widget _buildAppliedTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: List.generate(2, (index) => JobCardDate(
          companyName: 'Spotify',
          role: 'Backend Engineer',
          location: 'Amsterdam',
          jobType: 'Full-Time',
          description: 'Join our backend team and scale services.',
          applicants: 120,
          views: 500,
          date: 'Jul 2, 2025',
          companyLogo: 'assets/images/banner_2.png',
          showBookmark: false,
          onTap: () {},
        ),),
      ),
    );
  }


  Widget _buildSavedTab() {
    return ListView.builder(
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
    );
  }
}
