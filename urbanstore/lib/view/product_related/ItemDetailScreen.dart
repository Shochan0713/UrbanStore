// ignore_for_file: file_names, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:urbanstore/model/cart.dart';
import 'package:urbanstore/model/product.dart';
import 'package:urbanstore/model/product_list.dart';
import 'package:urbanstore/view/cart_purchase_related/CartManagementScreen.dart';
import 'package:urbanstore/viewmodel/common/app_bar.dart';
import 'package:urbanstore/viewmodel/common/bottom_navigation_bar.dart';
import 'package:urbanstore/viewmodel/common/drawer.dart';

class Itemdetailscreen extends StatelessWidget {
  final String productId;
  final Cart cart;
  Itemdetailscreen({super.key, required this.productId, required this.cart});
  final List<Product> productList = productListTest;
  @override
  Widget build(BuildContext context) {
    final product =
        productListTest.firstWhere((product) => product.id == productId);
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
            product.imageUrl.isNotEmpty
                ? Image.asset(product.imageUrl) // 画像を表示
                : Image.asset('assets/noimage.png'), // 画像がない場合
            const SizedBox(height: 16.0),
            Text(
              product.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              product.description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16.0),
            Text(
              '${product.price.toStringAsFixed(2)}円',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.green,
              ),
            ),
            ElevatedButton(
              child: const Text('戻る'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            ElevatedButton(
              child: const Text('カートに追加'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                cart.addToCart(product);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${product.name} がカートに追加されました。'),
                  ),
                );
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Cartmanagementscreen(cart: cart)));
              },
            ),
          ],
        ),
      ),
    );
  }
}
