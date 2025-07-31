import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:job_tracker/presentation/pages/company_detail_page.dart';
import 'package:job_tracker/presentation/widgets/app_bar_builder.dart';
import 'package:job_tracker/presentation/widgets/image_text_button.dart';
import 'package:job_tracker/presentation/widgets/no_result.dart'; // مطمئن شو این رو اضافه کردی
import '../../core/config/design_config.dart';
import '../providers/company_provider.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/icon_textfield.dart';

class CompaniesPage extends ConsumerStatefulWidget {
  const CompaniesPage({super.key});

  @override
  ConsumerState<CompaniesPage> createState() => _CompaniesPageState();
}

class _CompaniesPageState extends ConsumerState<CompaniesPage> {
  final TextEditingController searchCtrl = TextEditingController();
  String query = '';

  @override
  Widget build(BuildContext context) {
    final companies = ref.watch(allCompaniesProvider);
    final design = DesignConfig.current;

    return Scaffold(
      appBar: AppBarBuilder(title: 'Companies'),
      bottomNavigationBar: const BottomNavigation(currentIndex: 2),
      backgroundColor: design.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconTextField(
              controller: searchCtrl,
              icon: Icons.search,
              hintText: "Enter Company",
              onChanged: (value) {
                setState(() {
                  query = value.toLowerCase();
                });
              },
            ),
            const SizedBox(height: 24),
            Expanded(
              child: companies.when(
                data: (data) {
                  final filtered = data
                      .where((c) => c.name.toLowerCase().contains(query))
                      .toList();

                  if (filtered.isEmpty) {
                    return const NoResult(
                      image: 'assets/images/no_job.png',
                      text: 'There are no jobs',
                    );
                  }

                  return GridView.count(
                    crossAxisCount: 3,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 8,
                    childAspectRatio: 1.2,
                    children: filtered.map((company) {
                      return ImageTextButton(
                        image: company.logo,
                        text: company.name,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => CompanyDetailPage(company: company),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, _) => Center(child: Text('Error: $e')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
