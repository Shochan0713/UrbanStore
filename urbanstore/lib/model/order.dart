import 'package:urbanstore/model/oder_item.dart';
import 'package:urbanstore/model/oder_status.dart';
import 'package:urbanstore/model/user.dart';

class Order {
  final String id;
  final User user;
  final List<OrderItem> items;
  final double? totalAmount;
  final OrderStatus status;
  final DateTime orderDate;

  Order({
    required this.id,
    required this.user,
    required this.items,
    required this.totalAmount,
    required this.status,
    required this.orderDate,
  });

  double calculateTotalAmount() {
    return items.fold(0.0, (sum, item) => sum + item.calculateItemTotal());
  }
}
