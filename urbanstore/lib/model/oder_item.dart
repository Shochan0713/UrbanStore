import 'package:urbanstore/model/product.dart';

class OrderItem {
  final Product product;
  final int quantity;
  final double priceAtPurchase;

  OrderItem({
    required this.product,
    required this.quantity,
    required this.priceAtPurchase,
  });

  double calculateItemTotal() => quantity * priceAtPurchase;
}
