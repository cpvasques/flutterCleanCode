import 'package:flutter_clean_code/features/dashboard/data/models/product_model.dart';

class Section {
  final String title;
  final String description;
  final List<Product> products;

  Section({
    required this.title,
    required this.description,
    required this.products,
  });

  factory Section.fromJson(Map<String, dynamic> json) {
    return Section(
      title: json['title'],
      description: json['description'],
      products: List<Product>.from(json['products'].map((productJson) {
        return Product.fromJson(productJson);
      })),
    );
  }

  @override
  String toString() {
    return 'Section(title: $title, description: $description, products: $products)';
  }
}
