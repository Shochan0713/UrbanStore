// ignore_for_file: file_names, use_build_context_synchronously
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:urbanstore/model/cart.dart';
import 'package:urbanstore/model/oder_item.dart';
import 'package:urbanstore/model/oder_status.dart';
import 'package:urbanstore/model/order.dart' as custom_order;
import 'package:urbanstore/model/user_info.dart' as custom_user_info;
import 'package:urbanstore/model/payment_method.dart';
import 'package:urbanstore/view/cart_purchase_related/PurchaseCompleateScreen.dart';
import 'package:urbanstore/view/user_management/LoginScreen.dart';
import 'package:urbanstore/viewmodel/common/app_bar.dart';
import 'package:urbanstore/viewmodel/common/bottom_navigation_bar.dart';
import 'package:urbanstore/viewmodel/common/drawer.dart';
import 'package:urbanstore/viewmodel/common/textbutton.dart';

class Purchaseprocedurescreen extends StatefulWidget {
  final Cart cart;
  const Purchaseprocedurescreen({super.key, required this.cart});

  @override
  State<Purchaseprocedurescreen> createState() =>
      _PurchaseprocedurescreenState();
}

class _PurchaseprocedurescreenState extends State<Purchaseprocedurescreen> {
  PaymentMethod _selectedPaymentMethod = PaymentMethod.CREDIT_CARD;
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '決済方法を選択してください',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            RadioListTile<PaymentMethod>(
              title: const Text('クレジットカード'),
              value: PaymentMethod.CREDIT_CARD,
              groupValue: _selectedPaymentMethod,
              onChanged: (value) {
                setState(() {
                  _selectedPaymentMethod = value!;
                });
              },
            ),
            RadioListTile<PaymentMethod>(
              title: const Text('PayPal'),
              value: PaymentMethod.PAYPAL,
              groupValue: _selectedPaymentMethod,
              onChanged: (value) {
                setState(() {
                  _selectedPaymentMethod = value!;
                });
              },
            ),
            RadioListTile<PaymentMethod>(
              title: const Text('銀行振込'),
              value: PaymentMethod.BANK_TRANSFER,
              groupValue: _selectedPaymentMethod,
              onChanged: (value) {
                setState(() {
                  _selectedPaymentMethod = value!;
                });
              },
            ),
            const SizedBox(
              height: 16.0,
            ),
            Center(
              child: Text(
                '合計 ${widget.cart.totalPrice}円',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Center(
              child: CustomButton(
                index: 0,
                label: '購入する',
                onPressed: () async {
                  // Firebase Auth からユーザー情報を取得
                  User? firebaseUser = FirebaseAuth.instance.currentUser;
                  if (firebaseUser == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('ユーザー情報の取得に失敗しました。'),
                      ),
                    );
                    return Future.delayed(
                      const Duration(seconds: 2),
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                    );
                  }
                  custom_user_info.UserInfo userInfo =
                      custom_user_info.UserInfo.fromFirebaseUser(firebaseUser);

                  custom_order.Order order = custom_order.Order(
                    id: DateTime.now()
                        .millisecondsSinceEpoch
                        .toString(), // 一意なIDの生成
                    user: userInfo,
                    items: widget.cart.items
                        .map((item) => OrderItem(
                              id: item.product.id, // Product から id を取得
                              product: item.product, // Product オブジェクト
                              quantity: item.quantity,
                              price: item.product.price, // Product から price を取得
                            ))
                        .toList(),
                    totalAmount: widget.cart.totalPrice,
                    status: OrderStatus.PENDING,
                    orderDate: DateTime.now(),
                  );
                  await saveOrderToFirestore(order);
                  // 購入手続きの処理
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('購入が完了しました！'),
                  ));
                  widget.cart.items.clear();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Purchasecompleatescreen(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
