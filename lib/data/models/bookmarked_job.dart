
import 'job.dart';

class BookmarkedJobs {
  static final List<Job> _bookmarked = [];

  static List<Job> get items => _bookmarked;

  static void add(Job job) {
    if (!_bookmarked.any((j) => j.id == job.id)) {
      _bookmarked.add(job);
    }
  }

  static void remove(Job job) {
    _bookmarked.removeWhere((j) => j.id == job.id);
  }

  static bool contains(Job job) {
    return _bookmarked.any((j) => j.id == job.id);
  }
}
