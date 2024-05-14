import 'package:injectable/injectable.dart';
import 'package:flutter_clean_code/features/dashboard/data/models/product_model.dart';
import 'package:flutter_clean_code/features/dashboard/data/models/section_model.dart';
import 'package:flutter_clean_code/features/dashboard/data/datasources/dashboard_datasource.dart';
import 'package:flutter_clean_code/features/dashboard/domain/repositories/dashboard_repository.dart';

@LazySingleton(as: DashboardRepository)
class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardDataSource dataSource;

  DashboardRepositoryImpl(this.dataSource);

  @override
  Future<List<Section>> fetchSections(String products) async {
    final response = await dataSource.getSections(products);

    List<Section> sections = response.map((sectionModel) {
      return Section(
        title: sectionModel.title,
        description: sectionModel.description,
        products: sectionModel.products
            .map((productModel) => Product(
                  id: productModel.id,
                  name: productModel.name,
                ))
            .toList(),
      );
    }).toList();

    return sections;
  }
}
