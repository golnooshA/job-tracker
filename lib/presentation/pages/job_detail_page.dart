import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:job_tracker/data/models/job.dart';
import 'package:job_tracker/presentation/pages/web_view_page.dart';
import 'package:job_tracker/presentation/providers/notification_list_provider.dart';
import 'package:job_tracker/presentation/widgets/button_with_icon_row.dart';
import '../../core/config/design_config.dart';
import '../../data/models/applied_jobs.dart';
import '../../data/models/bookmarked_job.dart';
import '../../services/notification_service.dart';
import '../widgets/app_bar_builder.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/bullet_list.dart';
import '../widgets/expand_text.dart';
import '../widgets/icon_with_text.dart';
import '../widgets/section_title.dart';

class JobDetailPage extends ConsumerStatefulWidget {
  final Job job;
  const JobDetailPage({super.key, required this.job});

  @override
  ConsumerState<JobDetailPage> createState() => _JobDetailPageState();
}

class _JobDetailPageState extends ConsumerState<JobDetailPage> {
  bool _isApplied = false;
  bool _isBookmarked = false;

  @override
  void initState() {
    super.initState();
    _isApplied = AppliedJobs.contains(widget.job);
    _isBookmarked = BookmarkedJobs.contains(widget.job);
  }

  Future<void> _applyToJob() async {
    if (_isApplied) return;

    AppliedJobs.add(widget.job);
    setState(() => _isApplied = true);

    final prefs = await SharedPreferences.getInstance();
    final pushEnabled = prefs.getBool('pushNotification') ?? true;
    final statusEnabled = prefs.getBool('appliedStatusNotification') ?? true;

    final message = "You applied to ${widget.job.role} at ${widget.job.companyName}.";

    if (pushEnabled && statusEnabled) {
      ref.read(notificationListProvider.notifier).add(message);

      Future.delayed(const Duration(seconds: 2), () {
        NotificationService.showTestNotification(
          "Application Sent",
          message,
        );
      });
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => WebViewPage(
          url: widget.job.jobLink,
          title: widget.job.role,
        ),
      ),
    );
  }

  void _toggleBookmark() {
    setState(() {
      if (_isBookmarked) {
        BookmarkedJobs.remove(widget.job);
      } else {
        BookmarkedJobs.add(widget.job);
      }
      _isBookmarked = !_isBookmarked;
    });
  }

  @override
  Widget build(BuildContext context) {
    final design = DesignConfig.current;
    final job = widget.job;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBarBuilder(title: ''),
        bottomNavigationBar: const BottomNavigation(currentIndex: 0),
        backgroundColor: design.backgroundColor,
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 16),
              CircleAvatar(
                radius: 36,
                backgroundImage: NetworkImage(job.companyLogo),
              ),
              const SizedBox(height: 12),
              Text(
                job.role,
                style: TextStyle(
                  color: design.textColor,
                  fontSize: design.subtitleFontSize,
                  fontWeight: design.semiBold,
                  fontFamily: design.fontFamily,
                ),
              ),
              const SizedBox(height: 4),
              Text.rich(
                TextSpan(
                  text: '${job.companyName}  •  ',
                  style: TextStyle(
                    color: design.subTextColor,
                    fontSize: design.textFontSize,
                    fontWeight: design.light,
                    fontFamily: design.fontFamily,
                  ),
                  children: [
                    TextSpan(
                      text: job.jobType,
                      style: TextStyle(
                        color: design.primaryColor,
                        fontSize: design.textFontSize,
                        fontWeight: design.light,
                        fontFamily: design.fontFamily,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconWithText(
                      icon: Icons.people,
                      text: '${job.applicants}',
                      iconColor: design.buttonBlueColor,
                    ),
                    IconWithText(
                      icon: Icons.location_on,
                      text: job.location,
                      iconColor: design.buttonGreenColor,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TabBar(
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
                    Tab(text: 'Job Details'),
                    Tab(text: 'Company'),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Stack(
                  children: [
                    TabBarView(
                      children: [
                        _jobDetailsView(job),
                        _companyView(job.companyAbout),
                      ],
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        color: design.backgroundColor,
                        padding: const EdgeInsets.all(20),
                        child: ButtonWithIconRow(
                          onTap: _isApplied ? null : _applyToJob,
                          onIcon: _toggleBookmark,
                          bookmarkIcon: _isBookmarked
                              ? Icons.bookmark
                              : Icons.bookmark_border,
                          buttonText: _isApplied ? 'Applied' : 'Apply Now',
                          buttonColor: _isApplied
                              ? design.buttonLightGrayColor
                              : design.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _jobDetailsView(Job job) {
    final design = DesignConfig.current;

    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SectionTitle(title: "Description"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            child: Text(
              job.description,
              style: TextStyle(
                fontWeight: design.light,
                fontFamily: design.fontFamily,
                color: design.subTextColor,
                fontSize: design.subTextFontSize,
              ),
            ),
          ),
          const SizedBox(height: 16),
          if (job.skills.isNotEmpty) ...[
            const SectionTitle(title: "Skills Needed"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
              child: BulletList(items: job.skills),
            ),
          ],
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _companyView(String about) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SectionTitle(title: "Company Info"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            child: ExpandableText(text: about),
          ),
        ],
      ),
    );
  }
}
