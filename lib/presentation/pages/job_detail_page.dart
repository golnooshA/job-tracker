import 'package:flutter/material.dart';
import 'package:job_tracker/presentation/widgets/button_with_icon_row.dart';
import '../../core/config/design_config.dart';
import '../widgets/app_bar_builder.dart';
import '../widgets/bullet_list.dart';
import '../widgets/expand_text.dart';
import '../widgets/icon_with_text.dart';
import '../widgets/section_title.dart';

class JobDetailPage extends StatefulWidget {
  const JobDetailPage({super.key});

  @override
  State<JobDetailPage> createState() => _JobDetailPageState();
}

class _JobDetailPageState extends State<JobDetailPage>
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
              "UI Designer",
              style: TextStyle(
                color: DesignConfig.textColor,
                fontSize: DesignConfig.subTitleSize,
                fontWeight: DesignConfig.semiBold,
                fontFamily: DesignConfig.fontFamily,
              ),
            ),
            const SizedBox(height: 4),
            const Text.rich(
              TextSpan(
                text: 'Dribble  •  ',
                style: TextStyle(
                  color: DesignConfig.subTextColor,
                  fontSize: DesignConfig.textSize,
                  fontWeight: DesignConfig.semiBold,
                  fontFamily: DesignConfig.fontFamily,
                ),
                children: [
                  TextSpan(
                    text: 'Fulltime',
                    style: TextStyle(
                      color: DesignConfig.primaryColor,
                      fontSize: DesignConfig.textSize,
                      fontWeight: DesignConfig.semiBold,
                      fontFamily: DesignConfig.fontFamily,
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
                    text: '80',
                    iconColor: Colors.blue,
                  ),
                  IconWithText(
                    icon: Icons.location_on,
                    text: 'Yogyakarta',
                    iconColor: Colors.green,
                  ),
                ],
              ),
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
                    controller: _tabController,
                    children: [_jobDetailsView(), _CompanyView()],
                  ),

                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(20),
                      child: ButtonWithIconRow(
                        onTap: () {},
                        onIcon: () {},
                        buttonText: 'Apply Now',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _jobDetailsView() {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SectionTitle(title: "Descriptions"),
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
          const SectionTitle(title: "Responsibilities"),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            child: BulletList(
              items: [
                "Creating wireframes, UI and prototypes for mobile apps and websites",
                "Manage UI assets and styleguides",
                "Research design trends and competitor analysis",
              ],
            ),
          ),
          const SizedBox(height: 16),
          const SectionTitle(title: "Skills Needed"),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: BulletList(
              items: [
                "1+ years professional experience working on ui designing.",
                "Proficient with Sketch, Figma, Photoshop, Illustrator. Bonus if you’ve used apps like Invision, Zeplin, Principle.",
                "Ability to create high and low fidelity wireframes and prototypes.",
                "Fast learner and is eager to pick up new skills.",
                "Loves what they do, has opinions, works well in a team, and gets excited about users and design.",
                "Has a solid and up-to-date understanding of best practices, design trends in web and mobile design.",
              ],
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _CompanyView() {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          SectionTitle(title: "Descriptions"),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            child: ExpandableText(
              text:
                  "The good news is, currently Dribbble is opening job opportunities as UI Designers for designers to join us in developing and building Dribbble to be bigger and more advanced. "
                  "We offer a great team, creative freedom, and an opportunity to make real impact. "
                  "We value design deeply and you'll work closely with our product and engineering teams. "
                  "As a designer at Dribbble, you'll help shape the future of creative collaboration.",
            ),
          ),
        ],
      ),
    );
  }
}
