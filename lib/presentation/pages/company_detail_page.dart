import 'package:flutter/material.dart';
import '../../core/config/design_config.dart';
import '../widgets/app_bar_builder.dart';
import '../widgets/icon_with_text.dart';
import '../widgets/job_card_date.dart';
import '../widgets/section_title.dart';

class CompanyDetailPage extends StatefulWidget {
  const CompanyDetailPage({super.key});

  @override
  State<CompanyDetailPage> createState() => _CompanyDetailPageState();
}

class _CompanyDetailPageState extends State<CompanyDetailPage>
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
    return Scaffold(
      appBar: AppBarBuilder(title: ''),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            const CircleAvatar(
              radius: 36,
              backgroundImage: AssetImage('assets/images/banner_1.png'),
            ),
            const SizedBox(height: 12),
            const Text(
              "Dribble",
              style: TextStyle(
                color: DesignConfig.textColor,
                fontSize: DesignConfig.subTitleSize,
                fontWeight: DesignConfig.semiBold,
                fontFamily: DesignConfig.fontFamily,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Design Company',
              style: TextStyle(
                color: DesignConfig.subTextColor,
                fontSize: DesignConfig.textSize,
                fontWeight: DesignConfig.semiBold,
                fontFamily: DesignConfig.fontFamily,
              ),
            ),
            const SizedBox(height: 8),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconWithText(
                  icon: Icons.location_on,
                  text: 'Yogyakarta',
                  iconColor: Colors.green,
                ),
              ],
            ),

            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TabBar(
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
                  Tab(text: 'About'),
                  Tab(text: 'Job'),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [_CompanyDetailsView(), _JobView()],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _CompanyDetailsView() {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SectionTitle(title: "About"),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            child: Text(
              "The good news is, currently Dribbble is opening job opportunities as UI Designers for designers to join us in developing and building Dribbble to be bigger and more advanced.",
              style: TextStyle(
                fontWeight: DesignConfig.light,
                fontFamily: DesignConfig.fontFamily,
                color: DesignConfig.subTextColor,
                fontSize: DesignConfig.subTextSize,
              ),
            ),
          ),
          const SizedBox(height: 16),
          const SectionTitle(title: "More Information"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: _moreInformationSection(),
          ),
        ],
      ),
    );
  }

  Widget _moreInformationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _infoRow(
          title: 'Address',
          value:
              'Perum Mataram Bumi Sejahtera (MBS) Kav.31, Depok Sleman, Yogyakarta',
        ),
        _infoRow(
          title: 'Facility',
          value: 'Regular hours, Medical, Cozy place',
        ),
        _infoRow(title: 'Company Size', value: '1 - 100 Employees'),
        _infoRow(title: 'Specialization', value: 'IT/Computers'),
      ],
    );
  }

  Widget _infoRow({required String title, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: DesignConfig.fontFamily,
              fontSize: DesignConfig.subTextSize,
              color: DesignConfig.textColor,
              fontWeight: DesignConfig.semiBold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 13,
              color: DesignConfig.subTextColor,
              fontFamily: DesignConfig.fontFamily,
            ),
          ),
        ],
      ),
    );
  }

  Widget _JobView() {
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
      itemCount: 10,
      itemBuilder: (_, i) => Padding(
        padding: const EdgeInsets.only(bottom: 0),
        child: JobCardDate(
          companyName: 'Dribble',
          role: 'Project Manager',
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
    );
  }

}
