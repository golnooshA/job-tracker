import 'package:job_tracker/data/seed/seed_data.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDb() async {
  final dbPath = await getDatabasesPath();
  final path = join(dbPath, 'job_tracker.db');

  return openDatabase(
    path,
    version: 1,
    onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE companies (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT,
          logo TEXT,
          about TEXT,
          address TEXT,
          facility TEXT,
          size TEXT,
          specialization TEXT
        );
      ''');

      await db.execute('''
        CREATE TABLE categories (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT,
          icon TEXT
        );
      ''');

      await db.execute('''
        CREATE TABLE jobs (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          companyId INTEGER,
          categoryId INTEGER,
          role TEXT,
          location TEXT,
          jobType TEXT,
          jobLink TEXT,
          applicants INTEGER DEFAULT 0,
          views INTEGER DEFAULT 0,
          publishedDate TEXT,
          description TEXT,
          skills TEXT, -- Store as JSON string
          companyAbout TEXT,
          FOREIGN KEY(companyId) REFERENCES companies(id),
          FOREIGN KEY(categoryId) REFERENCES categories(id)
        );
      ''');

      await seedInitialData(db);
    },
  );
}
