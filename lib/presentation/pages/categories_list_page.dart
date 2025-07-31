import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:job_tracker/presentation/pages/one_category_page.dart';
import '../providers/category_provider.dart';
import '../utils/icon_mapper.dart';
import '../widgets/app_bar_builder.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/button_icon_category.dart';

class CategoriesListPage extends ConsumerWidget {
  const CategoriesListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(allCategoriesProvider);

    return Scaffold(
      appBar: AppBarBuilder(title: 'Categories'),
      bottomNavigationBar: const BottomNavigation(currentIndex: 0),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: categories.when(
          data: (data) => GridView.builder(
            itemCount: data.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              final category = data[index];
              return ButtonIconCategory(
                icon: getIconByName(category.iconName),
                text: category.name,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => OneCategoryPage(
                      categoryId: category.id,
                      categoryName: category.name,
                    ),
                  ),
                ),
              );
            },
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(child: Text('Error: $e')),
        ),
      ),
    );
  }
}
