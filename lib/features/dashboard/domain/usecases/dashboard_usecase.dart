import 'package:injectable/injectable.dart';
import '../repositories/dashboard_repository.dart';

@lazySingleton
class DashboardUseCase {
  final DashboardRepository repository;

  DashboardUseCase(this.repository);

  Future<dynamic> loadSections(bool isOriginal, String products) async {
    return await repository.fetchSections(products);
  }
}
