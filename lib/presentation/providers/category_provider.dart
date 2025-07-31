import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/category.dart';
import '../../data/repositories/category_repository.dart';


final categoryRepositoryProvider = Provider((ref) => CategoryRepository());

final allCategoriesProvider = FutureProvider<List<Category>>((ref) async {
  final repo = ref.watch(categoryRepositoryProvider);
  return repo.getAllCategories();
});
