// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:urbanstore/model/cart.dart';
import 'package:urbanstore/view/cart_purchase_related/PurchaseProcedureScreen.dart';
import 'package:urbanstore/viewmodel/common/app_bar.dart';
import 'package:urbanstore/viewmodel/common/drawer.dart';

class Cartmanagementscreen extends StatelessWidget {
  final Cart cart;
  const Cartmanagementscreen({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'UserRegistration',
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.home),
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: cart.items.isEmpty
                  ? const Center(child: Text('カートに商品がありません。'))
                  : ListView.builder(
                      itemCount: cart.items.length,
                      itemBuilder: (context, index) {
                        final item = cart.items[index];
                        return ListTile(
                          title: Text(item.product.name),
                          subtitle: Text(
                              '数量: ${item.quantity} | ${item.product.price * item.quantity} 円'),
                          trailing: IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () {
                              cart.removeFromCart(item.product);
                            },
                          ),
                        );
                      },
                    ),
            ),
            const SizedBox(height: 16.0),
            Text(
              '合計: ${cart.totalPrice} 円',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              child: const Text('購入する'),
              onPressed: () {
                // 購入手続きの処理
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('購入が完了しました！'),
                ));
                Future.delayed(const Duration(seconds: 2), () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Purchaseprocedurescreen(cart: cart)));
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
