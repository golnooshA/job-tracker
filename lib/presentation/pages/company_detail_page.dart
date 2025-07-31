import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:job_tracker/presentation/widgets/app_bar_builder.dart';
import 'package:job_tracker/presentation/widgets/icon_with_text.dart';
import 'package:job_tracker/presentation/widgets/job_card_date.dart';
import 'package:job_tracker/presentation/widgets/section_title.dart';
import '../../core/config/design_config.dart';
import '../../data/models/bookmarked_job.dart';
import '../../data/models/company.dart';
import '../providers/job_provider.dart';
import '../widgets/bottom_navigation.dart';
import 'job_detail_page.dart';

class CompanyDetailPage extends ConsumerStatefulWidget {
  final Company company;

  const CompanyDetailPage({super.key, required this.company});

  @override
  ConsumerState<CompanyDetailPage> createState() => _CompanyDetailPageState();
}

class _CompanyDetailPageState extends ConsumerState<CompanyDetailPage>
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
    final company = widget.company;

    return Scaffold(
      backgroundColor: design.backgroundColor,
      appBar: AppBarBuilder(title: ''),
      bottomNavigationBar: const BottomNavigation(currentIndex: 2),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            CircleAvatar(
              radius: 36,
              backgroundImage: NetworkImage(company.logo),
              backgroundColor: Colors.transparent,
            ),
            const SizedBox(height: 12),
            Text(
              company.name,
              style: TextStyle(
                color: design.textColor,
                fontSize: design.subtitleFontSize,
                fontWeight: design.semiBold,
                fontFamily: design.fontFamily,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              company.specialization,
              style: TextStyle(
                color: design.darkGrayColor,
                fontSize: design.textFontSize,
                fontWeight: design.light,
                fontFamily: design.fontFamily,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconWithText(
                  icon: Icons.location_on,
                  text: company.address,
                  iconColor: design.primaryColor,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
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
                  Tab(text: 'About'),
                  Tab(text: 'Jobs'),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _CompanyDetailsView(company),
                  _JobView(company.id),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _CompanyDetailsView(Company company) {
    final design = DesignConfig.current;

    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SectionTitle(title: "About"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            child: Text(
              company.about,
              style: TextStyle(
                fontWeight: design.light,
                fontFamily: design.fontFamily,
                color: design.subTextColor,
                fontSize: design.subTextFontSize,
              ),
            ),
          ),
          const SizedBox(height: 16),
          const SectionTitle(title: "More Information"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: _moreInformationSection(company),
          ),
        ],
      ),
    );
  }

  Widget _moreInformationSection(Company company) {
    final design = DesignConfig.current;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _infoRow(title: 'Address', value: company.address),
        _infoRow(title: 'Facility', value: company.facility),
        _infoRow(title: 'Company Size', value: company.size),
        _infoRow(title: 'Specialization', value: company.specialization),
      ],
    );
  }

  Widget _infoRow({required String title, required String value}) {
    final design = DesignConfig.current;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: design.light,
              fontFamily: design.fontFamily,
              color: design.textColor,
              fontSize: design.subTextFontSize,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: design.subTextFontSize,
              color: design.subTextColor,
              fontFamily: design.fontFamily,
            ),
          ),
        ],
      ),
    );
  }

  Widget _JobView(int companyId) {
    final jobs = ref.watch(jobsByCompanyProvider(companyId));
    final design = DesignConfig.current;

    return jobs.when(
      data: (data) => ListView.builder(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
        itemCount: data.length,
        itemBuilder: (_, i) {
          final job = data[i];
          final isBookmarked = BookmarkedJobs.contains(job);

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
            isBookmarked: isBookmarked,
            onIcon: () {
              setState(() {
                if (isBookmarked) {
                  BookmarkedJobs.remove(job);
                } else {
                  BookmarkedJobs.add(job);
                }
              });
            },
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => JobDetailPage(job: job)),
              );
            },
          );
        },
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Error: $e', style: TextStyle(color: design.errorColor))),
    );
  }
}
