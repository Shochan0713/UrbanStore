import 'package:flutter/material.dart';
import 'package:urbanstore/model/product.dart';
import 'package:urbanstore/model/product_list.dart';
import 'package:urbanstore/view/user_management/UserRegistrationScreen.dart';
import 'package:urbanstore/viewmodel/common/app_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final List<Product> productList = productListTest;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Home',
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
          children: <Widget>[
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                ),
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  final product = productList[index];
                  return Card(
                    child: Column(
                      children: [
                        product.imageUrl.isNotEmpty
                            ? Image.asset(product.imageUrl) // 画像を表示
                            : Image.asset('assets/noimage.png'),
                        // 画像がない場合は空のコンテナを表示
                        Text(product.name), // 商品名
                        Text(product.description),
                        Text(
                            '\$${product.price.toStringAsFixed(2)}'), // 価格を小数点以下2桁で表示
                      ],
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
