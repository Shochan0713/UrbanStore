import 'package:flutter/material.dart';
import 'package:urbanstore/model/cart.dart';
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
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: cart.items.isEmpty
                  ? Center(child: Text('カートに商品がありません。'))
                  : ListView.builder(
                      itemCount: cart.items.length,
                      itemBuilder: (context, index) {
                        final item = cart.items[index];
                        return ListTile(
                          title: Text(item.product.name),
                          subtitle: Text(
                              '数量: ${item.quantity} | ${item.product.price * item.quantity} 円'),
                          trailing: IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              cart.removeFromCart(item.product);
                            },
                          ),
                        );
                      },
                    ),
            ),
            SizedBox(height: 16.0),
            Text(
              '合計: ${cart.totalPrice} 円',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('購入する'),
              onPressed: () {
                // 購入手続きの処理
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('購入が完了しました！'),
                ));
                cart.items.clear(); // 購入後、カートをクリア
              },
            ),
          ],
        ),
      ),
    );
  }
}
