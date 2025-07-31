import '../db.dart';
import '../models/company.dart';

class CompanyRepository {
  Future<List<Company>> getAllCompanies() async {
    final db = await getDb();
    final result = await db.query('companies');
    return result.map((e) => Company.fromMap(e)).toList();
  }
}