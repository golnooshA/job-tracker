import '../db.dart';
import '../models/category.dart';

class CategoryRepository {
  Future<List<Category>> getAllCategories() async {
    final db = await getDb();
    final result = await db.query('categories');
    return result.map((e) => Category.fromMap(e)).toList();
  }
}