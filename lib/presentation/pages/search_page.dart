import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:job_tracker/core/config/design_config.dart';
import 'package:job_tracker/data/models/bookmarked_job.dart';
import 'package:job_tracker/data/models/job.dart';
import 'package:job_tracker/presentation/pages/job_detail_page.dart';
import 'package:job_tracker/presentation/providers/search_provider.dart';
import 'package:job_tracker/presentation/widgets/app_bar_builder.dart';
import 'package:job_tracker/presentation/widgets/bottom_navigation.dart';
import 'package:job_tracker/presentation/widgets/button_text.dart';
import 'package:job_tracker/presentation/widgets/icon_textfield.dart';
import 'package:job_tracker/presentation/widgets/job_card_date.dart';
import 'package:job_tracker/presentation/widgets/no_result.dart';

final currentSearchQueryProvider = StateProvider<SearchQuery?>((ref) => null);

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  final TextEditingController _ctrl = TextEditingController();
  bool _isAdvanced = false;

  String keyword = '';
  String? selectedCategory;
  List<String> selectedTypes = [];
  String sortBy = 'Newest';

  final List<String> categories = [
    'Design', 'Developer', 'Finance', 'Marketing', 'Product'
  ];

  final List<String> jobTypes = [
    'Full Time', 'Part Time', 'Remote', 'Contract'
  ];

  final List<String> sortOptions = [
    'Newest', 'Popular', 'Highest Salary'
  ];

  void _submitSearch() {
    if (keyword.trim().isEmpty) return;

    ref.read(currentSearchQueryProvider.notifier).state = SearchQuery(
      keyword: keyword,
      category: selectedCategory,
      types: selectedTypes,
      sortBy: sortBy,
    );
  }

  @override
  Widget build(BuildContext context) {
    final design = DesignConfig.current;

    final query = ref.watch(currentSearchQueryProvider);
    final jobs = query == null ? null : ref.watch(searchJobsProvider(query));

    return Scaffold(
      backgroundColor: design.backgroundColor,
      appBar: AppBarBuilder(title: 'Search', automaticallyImplyLeading: false),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ButtonText(
              title: _isAdvanced ? 'Apply Filter' : 'Search',
              onTap: _submitSearch,
            ),
          ),
          const BottomNavigation(currentIndex: 1),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            const SizedBox(height: 20),
            IconTextField(
              controller: _ctrl,
              icon: Icons.search,
              hintText: "Enter Keyword",
              onChanged: (v) => setState(() => keyword = v.trim()),
            ),
            const SizedBox(height: 24),
            _buildAdvancedSearchToggle(),
            if (_isAdvanced) _buildAdvancedFilters(),
            const SizedBox(height: 20),
            if (jobs != null && query != null) _buildResults(jobs, query),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildAdvancedSearchToggle() {
    final design = DesignConfig.current;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Advanced Search',
          style: TextStyle(
              fontFamily: design.fontFamily,
              fontSize: design.textFontSize,
              fontWeight: design.semiBold,
              color: design.textColor
          ),
        ),
        Switch(
          value: _isAdvanced,
          onChanged: (val) => setState(() => _isAdvanced = val),
          activeColor: design.primaryColor,
        ),
      ],
    );
  }

  Widget _buildAdvancedFilters() {
    final design = DesignConfig.current;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text('Category', style: TextStyle(color: design.textColor)),
        DropdownButton<String>(
          isExpanded: true,
          hint: Text('Select Category', style: TextStyle(color: design.subTextColor,
          fontWeight: design.light,
          fontFamily: design.fontFamily)),
          value: selectedCategory,
          dropdownColor: design.backgroundColor,
          style: TextStyle(color: design.textColor),
          onChanged: (val) => setState(() => selectedCategory = val),
          items: categories.map((c) => DropdownMenuItem(
            value: c,
            child: Text(c, style: TextStyle(color: design.subTextColor,
                fontWeight: design.light,
                fontFamily: design.fontFamily)),
          )).toList(),
        ),
        const SizedBox(height: 16),
        Text('Job Type', style: TextStyle(color: design.textColor,
            fontWeight: design.light,
            fontFamily: design.fontFamily)),
        const SizedBox(height: 8),
        Wrap(
          spacing: 12,
          children: jobTypes.map((type) {
            return FilterChip(
              label: Text(type),
              selected: selectedTypes.contains(type),
              selectedColor: design.primaryColor.withOpacity(0.1),
              checkmarkColor: design.primaryColor,
              backgroundColor: design.backgroundColor,
              onSelected: (selected) {
                setState(() {
                  selected
                      ? selectedTypes.add(type)
                      : selectedTypes.remove(type);
                });
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 16),
        Text('Sort By', style: TextStyle(color: design.textColor,
            fontWeight: design.light,
            fontFamily: design.fontFamily)),
        DropdownButton<String>(
          isExpanded: true,
          value: sortBy,
          dropdownColor: design.backgroundColor,
          style: TextStyle(color: design.textColor),
          onChanged: (v) => setState(() => sortBy = v!),
          items: sortOptions.map((s) => DropdownMenuItem(
            value: s,
            child: Text(s, style: TextStyle(color: design.subTextColor,
                fontWeight: design.light,
                fontFamily: design.fontFamily)),
          )).toList(),
        ),
      ],
    );
  }

  Widget _buildResults(AsyncValue<List<Job>> jobs, SearchQuery query) {
    final design = DesignConfig.current;

    return jobs.when(
      data: (data) {
        if (data.isEmpty) {
          return const Padding(
            padding: EdgeInsets.only(top: 120),
            child: NoResult(
              image: 'assets/images/no_result.png',
              text: 'There are no results',
            ),
          );
        }

        return Column(
          children: data.map((job) {
            final isSaved = BookmarkedJobs.contains(job);
            return JobCardDate(
              companyName: job.companyName,
              companyLogo: job.companyLogo,
              role: job.role,
              location: job.location,
              jobType: job.jobType,
              description: job.description,
              applicants: job.applicants,
              views: job.views,
              date: job.publishedDate,
              isBookmarked: isSaved,
              showBookmark: true,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => JobDetailPage(job: job)),
                );
              },
              onIcon: () {
                setState(() {
                  if (isSaved) {
                    BookmarkedJobs.remove(job);
                  } else {
                    BookmarkedJobs.add(job);
                  }
                });
                ref.invalidate(searchJobsProvider(query));
              },
            );
          }).toList(),
        );
      },
      loading: () => const Padding(
        padding: EdgeInsets.only(top: 30),
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (e, _) => Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Center(
          child: Text('Error: $e', style: TextStyle(color: design.errorColor)),
        ),
      ),
    );
  }
}
