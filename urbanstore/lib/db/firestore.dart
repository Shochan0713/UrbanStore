// Firestoreインスタンスの取得
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:urbanstore/model/address.dart';
import 'package:urbanstore/model/product.dart';
import 'package:urbanstore/model/user_info.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// Userデータの追加
Future<void> addUser(UserInfo user) async {
  await _firestore.collection('users').doc(user.id).set(user.toMap());
}

// Addressデータの追加
Future<void> addAddress(Address address) async {
  await _firestore
      .collection('addresses')
      .doc(address.street)
      .set(address.toMap());
}

// Productデータの追加
Future<void> addProduct(Product product) async {
  await _firestore.collection('products').doc(product.id).set(product.toMap());
}
