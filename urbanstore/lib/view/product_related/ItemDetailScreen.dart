import 'package:flutter/material.dart';
import 'package:urbanstore/model/product.dart';
import 'package:urbanstore/model/product_list.dart';
import 'package:urbanstore/viewmodel/common/app_bar.dart';

class Itemdetailscreen extends StatelessWidget {
  final String productId;

  Itemdetailscreen({super.key, required this.productId});
  final List<Product> productList = productListTest;
  @override
  Widget build(BuildContext context) {
    final product =
        productListTest.firstWhere((product) => product.id == productId);
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
              '\$${product.price.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.green,
              ),
            ),
            ElevatedButton(
              child: const Text('Button'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
