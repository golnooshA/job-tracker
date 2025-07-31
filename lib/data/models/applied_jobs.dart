import 'package:job_tracker/data/models/job.dart';

class AppliedJobs {
  static final List<Job> _applied = [];

  static List<Job> get items => _applied;

  static void add(Job job) {
    if (!_applied.any((j) => j.id == job.id)) {
      _applied.add(job);
    }
  }

  static bool contains(Job job) {
    return _applied.any((j) => j.id == job.id);
  }
}

