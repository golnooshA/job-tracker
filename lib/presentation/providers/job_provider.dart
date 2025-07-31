import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/models/job.dart';
import '../../data/repositories/job_repository.dart';
import 'notification_list_provider.dart';

final jobRepositoryProvider = Provider<JobRepository>((ref) => JobRepository());

final recentJobsProvider = FutureProvider<List<Job>>((ref) async {
  final repository = ref.read(jobRepositoryProvider);
  final jobs = await repository.getRecentJobs();

  final prefs = await SharedPreferences.getInstance();

  final pushEnabled = prefs.getBool('pushNotification') ?? true;
  final newJobNotifEnabled = prefs.getBool('newJobNotification') ?? true;
  final alreadyNotified = prefs.getBool('newJobsNotified') ?? false;
  final previousCount = prefs.getInt('lastJobCount') ?? 0;

  // Check if new jobs added and user wants to be notified
  if (jobs.length > previousCount && !alreadyNotified && pushEnabled && newJobNotifEnabled) {
    ref.read(notificationListProvider.notifier).add(
        "New jobs have been posted. Check them out!"
    );

    await prefs.setBool('newJobsNotified', true);
    await prefs.setInt('lastJobCount', jobs.length);
  } else if (jobs.length > previousCount) {
    // Update job count but skip notification if user disabled it
    await prefs.setInt('lastJobCount', jobs.length);
  } else if (jobs.length == previousCount && alreadyNotified) {
    // Reset notification flag to allow future alerts when new jobs come again
    await prefs.setBool('newJobsNotified', false);
  }

  return jobs;
});

final jobsByCategoryProvider = FutureProvider.family<List<Job>, int>((ref, categoryId) async {
  final repository = ref.read(jobRepositoryProvider);
  return repository.getJobsByCategory(categoryId);
});

final jobsByCompanyProvider = FutureProvider.family<List<Job>, int>((ref, companyId) async {
  final repository = ref.read(jobRepositoryProvider);
  return repository.getJobsByCompany(companyId);
});
