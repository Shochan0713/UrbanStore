import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:urbanstore/model/cart.dart';
import 'package:urbanstore/model/order.dart' as custom_order;

class CartViewModel extends ChangeNotifier {
  Future<void> saveOrderToFirestore(custom_order.Order order) async {
    try {
      await FirebaseFirestore.instance
          .collection('orders')
          .doc(order.id)
          .set(order.toMap());
    } catch (e) {
      // ignore: avoid_print
      print("Error saving order to Firestore: $e");
    }
  }
}
