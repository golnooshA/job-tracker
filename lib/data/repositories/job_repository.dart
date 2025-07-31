import '../db.dart';
import '../models/job.dart';
import '../../presentation/providers/search_provider.dart';

class JobRepository {
  Future<List<Job>> getRecentJobs() async {
    final db = await getDb();
    final result = await db.rawQuery('''
      SELECT jobs.*, 
             companies.name AS companyName, 
             companies.logo AS companyLogo,
             companies.about AS companyAbout
      FROM jobs
      JOIN companies ON jobs.companyId = companies.id
      ORDER BY jobs.id DESC
      LIMIT 6
    ''');
    return result.map((e) => Job.fromMap(e)).toList();
  }

  Future<List<Job>> getJobsByCategory(int categoryId) async {
    final db = await getDb();
    final result = await db.rawQuery('''
      SELECT jobs.*, 
             companies.name AS companyName, 
             companies.logo AS companyLogo,
             companies.about AS companyAbout
      FROM jobs
      JOIN companies ON jobs.companyId = companies.id
      WHERE jobs.categoryId = ?
      ORDER BY jobs.id DESC
    ''', [categoryId]);

    return result.map((e) => Job.fromMap(e)).toList();
  }

  Future<List<Job>> getJobsByCompany(int companyId) async {
    final db = await getDb();
    final result = await db.rawQuery('''
      SELECT jobs.*, 
             companies.name AS companyName, 
             companies.logo AS companyLogo,
             companies.about AS companyAbout
      FROM jobs
      JOIN companies ON jobs.companyId = companies.id
      WHERE jobs.companyId = ?
      ORDER BY jobs.id DESC
    ''', [companyId]);

    return result.map((e) => Job.fromMap(e)).toList();
  }

  Future<List<Job>> searchJobs(SearchQuery query) async {
    final db = await getDb();

    String where = '1 = 1';
    List<dynamic> whereArgs = [];

    if (query.keyword.isNotEmpty) {
      where += ' AND (jobs.role LIKE ? OR companies.name LIKE ?)';
      whereArgs.addAll(['%${query.keyword}%', '%${query.keyword}%']);
    }

    if (query.category != null && query.category!.isNotEmpty) {
      where += ' AND jobs.categoryId IN (SELECT id FROM categories WHERE name = ?)';
      whereArgs.add(query.category);
    }

    if (query.types.isNotEmpty) {
      final placeholders = List.filled(query.types.length, '?').join(', ');
      where += ' AND jobs.jobType IN ($placeholders)';
      whereArgs.addAll(query.types);
    }

    final orderBy = switch (query.sortBy) {
      'Popular' => 'jobs.views DESC',
      'Highest Salary' => 'jobs.salary DESC',
      _ => 'jobs.id DESC',
    };

    final result = await db.rawQuery('''
      SELECT jobs.*, 
             companies.name AS companyName, 
             companies.logo AS companyLogo,
             companies.about AS companyAbout
      FROM jobs
      JOIN companies ON jobs.companyId = companies.id
      JOIN categories ON jobs.categoryId = categories.id
      WHERE $where
      ORDER BY $orderBy
    ''', whereArgs);

    return result.map((e) => Job.fromMap(e)).toList();
  }
}
