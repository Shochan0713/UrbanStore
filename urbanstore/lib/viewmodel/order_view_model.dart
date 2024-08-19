import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:urbanstore/model/order.dart' as custom_order;

class OrderViewModel {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<custom_order.Order>> fetchOrders() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        throw Exception('ユーザーがログインしていません');
      }

      String currentUserId = currentUser.uid;

      QuerySnapshot snapshot = await _firestore
          .collection('orders')
          .where('user.id', isEqualTo: currentUserId)
          .get();

      return snapshot.docs
          .map((doc) => custom_order.Order.fromFireStore(doc))
          .toList();
    } catch (e) {
      // ignore: avoid_print
      print('データの取得または変換中にエラーが発生しました: $e');
      rethrow; // エラーを再スローして上位で処理できるようにする
    }
  }
}
