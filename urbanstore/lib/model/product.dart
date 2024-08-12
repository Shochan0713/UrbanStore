import 'dart:ffi';

class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final int stockQuantity;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.stockQuantity,
  });

  bool isInStock() => stockQuantity > 0;
}
