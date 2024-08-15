import 'package:flutter/material.dart';
import 'package:urbanstore/model/cart.dart';
import 'package:urbanstore/model/product.dart';
import 'package:urbanstore/model/product_list.dart';
import 'package:urbanstore/view/product_related/ItemDetailScreen.dart';
import 'package:urbanstore/viewmodel/common/app_bar.dart';
import 'package:urbanstore/viewmodel/common/drawer.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Product> productList = productListTest;
  int currentPage = 0;
  final int itemsPerPage = 16;
  final cart = Cart();
  @override
  Widget build(BuildContext context) {
    final int startIndex = currentPage * itemsPerPage;
    final int endIndex = (startIndex + itemsPerPage < productList.length)
        ? startIndex + itemsPerPage
        : productList.length;
    final List<Product> currentProductList =
        productList.sublist(startIndex, endIndex);
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
      drawer: CustomDrawer(),
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
                itemCount: currentProductList.length,
                itemBuilder: (context, index) {
                  final product = currentProductList[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Itemdetailscreen(
                                  productId: product.id, cart: cart)));
                    },
                    child: Card(
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
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: currentPage > 0
                      ? () {
                          setState(() {
                            currentPage--;
                          });
                        }
                      : null,
                  child: const Text('Previous'),
                ),
                ElevatedButton(
                  onPressed: endIndex < productList.length
                      ? () {
                          setState(() {
                            currentPage++;
                          });
                        }
                      : null,
                  child: const Text('Next'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
