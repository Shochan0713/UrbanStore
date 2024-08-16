import 'package:urbanstore/model/product.dart';

class OrderItem {
  final String id;
  final Product product;
  final int quantity;
  final double? price; // 単価

  OrderItem({
    required this.id,
    required this.product,
    required this.quantity,
    this.price,
  });

  factory OrderItem.fromMap(Map<String, dynamic> data) {
    return OrderItem(
      id: data['id'],
      product: Product.fromMap(data['product']), // 商品情報の変換
      quantity: data['quantity'],
      price: data['price'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'product': product.toMap(),
      'quantity': quantity,
      'price': price,
    };
  }
}
