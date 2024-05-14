// Flutter Packages
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

// Core
import 'package:flutter_clean_code/core/error/error_handler.dart';
import 'package:flutter_clean_code/core/network/api_client.dart';
import 'package:flutter_clean_code/features/dashboard/data/models/section_model.dart';

@lazySingleton
class DashboardDataSource {
  final CustomDio dio;

  DashboardDataSource({required this.dio});

  Future<List<Section>> getSections(String products) async {
    try {
      Uri uri = Uri.parse('endpoint');

      Map<String, dynamic> queryParams = {
        'argument': products.isNotEmpty ? products : '*'
      };

      uri = uri.replace(queryParameters: queryParams);

      final response = await dio.auth().get(uri.toString());

      if (response.statusCode == 200) {
        final data = response.data['sections'];

        List<Section> sections = data.map<Section>((sectionData) {
          return Section.fromJson(sectionData as Map<String, dynamic>);
        }).toList();

        return sections;
      } else {
        throw Exception('Failed to request');
      }
    } on DioException catch (e) {
      throw RepositoryException.fromDioError(e);
    }
  }
}
