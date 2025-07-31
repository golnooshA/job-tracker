import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/job.dart';
import 'job_provider.dart';

class SearchQuery {
  final String keyword;
  final String? category;
  final List<String> types;
  final String sortBy;

  SearchQuery({
    required this.keyword,
    this.category,
    this.types = const [],
    this.sortBy = 'Newest',
  });
}

final searchJobsProvider = FutureProvider.family<List<Job>, SearchQuery>((ref, query) async {
  final repo = ref.read(jobRepositoryProvider);
  return repo.searchJobs(query);
});
