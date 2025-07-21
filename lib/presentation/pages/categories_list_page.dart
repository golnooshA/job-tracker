import 'package:flutter/material.dart';
import 'package:job_tracker/presentation/pages/one_category_page.dart';

import '../widgets/app_bar_builder.dart';
import '../widgets/button_icon_category.dart';

class CategoriesListPage extends StatelessWidget {
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

  CategoriesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBuilder(title: 'Categories'),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
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
                MaterialPageRoute(builder: (_) =>  OneCategoryPage()),
              );
            },
          );
        },
      ),
    );
  }
}
