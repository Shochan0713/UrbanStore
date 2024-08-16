import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:urbanstore/model/oder_item.dart';
import 'package:urbanstore/model/oder_status.dart';
import 'package:urbanstore/model/user_info.dart';

class Order {
  final String id;
  final UserInfo user;
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

  factory Order.fromFireStore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    return Order(
      id: doc.id,
      user: UserInfo.fromMap(data['user']),
      items: (data['items'] as List)
          .map((item) => OrderItem.fromMap(item))
          .toList(),
      totalAmount: data['totalAmount'],
      status:
          OrderStatus.values.firstWhere((e) => e.toString() == data['status']),
      orderDate: (data['orderDate'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user': user.toMap(),
      'items': items.map((item) => item.toMap()).toList(),
      'totalAmount': totalAmount,
      'status': status.toString(),
      'orderDate': Timestamp.fromDate(orderDate),
    };
  }
}
