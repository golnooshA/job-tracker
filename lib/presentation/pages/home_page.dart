import 'package:flutter/material.dart';
import 'package:job_tracker/core/config/design_config.dart';
import 'package:job_tracker/presentation/pages/categories_list_page.dart';
import 'package:job_tracker/presentation/pages/recent_job_page.dart';
import 'package:job_tracker/presentation/pages/recommended_page.dart';
import 'package:job_tracker/presentation/widgets/banner.dart';
import 'package:job_tracker/presentation/widgets/button_icon_category.dart';
import 'package:job_tracker/presentation/widgets/job_card.dart';
import 'package:job_tracker/presentation/widgets/title_section.dart';
import '../widgets/icon_textfield.dart';
import '../widgets/job_card_date.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {'icon': Icons.design_services, 'label': 'Design'},
      {'icon': Icons.code, 'label': 'Developer'},
      {'icon': Icons.network_wifi, 'label': 'Network'},
      {'icon': Icons.verified, 'label': 'Quality'},
      {'icon': Icons.campaign, 'label': 'Marketing'},
      {'icon': Icons.person, 'label': 'Secretary'},
      {'icon': Icons.analytics, 'label': 'Analysis'},
      {'icon': Icons.more_horiz, 'label': 'More'},
    ];

    final searchCtrl = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello,",
                        style: TextStyle(
                          fontFamily: DesignConfig.fontFamily,
                          fontSize: DesignConfig.textSize,
                          fontWeight: DesignConfig.light,
                          color: DesignConfig.subTextColor,
                        ),
                      ),

                      Text(
                        "Jack Fisher",
                        style: TextStyle(
                          fontFamily: DesignConfig.fontFamily,
                          fontSize: DesignConfig.headerSize,
                          fontWeight: DesignConfig.semiBold,
                          color: DesignConfig.textColor,
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.notifications_none,
                    color: DesignConfig.unSelectedIcon,
                    size: DesignConfig.iconSize,
                  ),
                ],
              ),
              const SizedBox(height: 20),

              IconTextField(
                controller: searchCtrl,
                icon: Icons.search,
                hintText: "Enter Keyword",
                onChanged: (p0) {},
              ),

              const SizedBox(height: 20),

              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    BannerCard(image: 'assets/images/banner_1.png'),
                    const SizedBox(width: 10),
                    BannerCard(image: 'assets/images/banner_2.png'),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              GridView.builder(
                shrinkWrap: true,
                itemCount: categories.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  final item = categories[index];
                  return ButtonIconCategory(
                    icon: item['icon'] as IconData,
                    text: item['label'] as String,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) =>  CategoriesListPage()),
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 20),

              TitleSection(
                title: "Recommended for you",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const RecommendedPage()),
                  );
                },
              ),

              const SizedBox(height: 10),

              Row(
                children: [
                  Expanded(
                    child: JobCard(
                      companyLogo: 'assets/images/banner_1.png',
                      companyName: 'Spotify',
                      role: 'Project manager',
                      location: 'Dubai, UAE',
                      jobType: 'Full Time',
                      applicants: 23,
                      views: 784,
                      onTap: () {},
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: JobCard(
                      companyLogo: 'assets/images/banner_1.png',
                      companyName: 'Spotify',
                      role: 'Project manager',
                      location: 'Dubai, UAE',
                      jobType: 'Full Time',
                      applicants: 23,
                      views: 784,
                      onTap: () {},
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
              TitleSection(title: "Recently Job Opening", onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const RecentlyJobPage()),
                );
              },
              ),
              const SizedBox(height: 10),
              JobCardDate(
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
              ),
              JobCardDate(
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
              ),

            ],
          ),
        ),
      ),
    );
  }
}
