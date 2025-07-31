import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/company.dart';
import '../../data/repositories/company_repository.dart';

final companyRepositoryProvider = Provider((ref) => CompanyRepository());

final allCompaniesProvider = FutureProvider<List<Company>>((ref) async {
  final repo = ref.watch(companyRepositoryProvider);
  return repo.getAllCompanies();
});


