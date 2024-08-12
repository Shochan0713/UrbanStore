import 'package:urbanstore/model/product.dart';

class CartItem {
  final Product product;
  final int quantity;

  CartItem({
    required this.product,
    required this.quantity,
  }) : assert(quantity > 0, 'Quantity must be greater than zero');

  double calculateItemTotal() => product.price * quantity;
}
