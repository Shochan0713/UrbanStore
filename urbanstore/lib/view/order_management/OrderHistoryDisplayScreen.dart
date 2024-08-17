// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:urbanstore/model/order.dart' as custom_order;
import 'package:urbanstore/view/order_management/OrderDetailDisplayScreen.dart';
import 'package:urbanstore/viewmodel/common/app_bar.dart';
import 'package:urbanstore/viewmodel/common/bottom_navigation_bar.dart';
import 'package:urbanstore/viewmodel/common/drawer.dart';

class OrderHistoryDisplayScreen extends StatefulWidget {
  const OrderHistoryDisplayScreen({super.key});

  @override
  _OrderHistoryDisplayScreenState createState() =>
      _OrderHistoryDisplayScreenState();
}

class _OrderHistoryDisplayScreenState extends State<OrderHistoryDisplayScreen> {
  late Future<List<custom_order.Order>> _ordersFuture;

  @override
  void initState() {
    super.initState();
    _ordersFuture = _fetchOrders();
  }

  Future<List<custom_order.Order>> _fetchOrders() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        throw Exception('ユーザーがログインしていません');
      }

      String currentUserId = currentUser.uid;

      QuerySnapshot snapshot = await FirebaseFirestore.instance
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.home),
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      bottomNavigationBar: CustomBottomNavBar(currentIndex: null),
      body: FutureBuilder<List<custom_order.Order>>(
        future: _ordersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('エラー: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('購入履歴がありません。'));
          }

          final orders = snapshot.data!;

          return ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final order = orders[index];
              return ListTile(
                title: Text('注文ID: ${order.id}'),
                subtitle: Text('合計: ${order.totalAmount}円'),
                // ignore: unnecessary_string_interpolations
                trailing: Text('${order.status.toString().split('.').last}'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          OrderDetailDisplayScreen(order: order),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
