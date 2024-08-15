import 'package:flutter/material.dart';
import 'package:urbanstore/model/cart.dart';
import 'package:urbanstore/model/product.dart';
import 'package:urbanstore/model/product_list.dart';
import 'package:urbanstore/view/product_related/ItemDetailScreen.dart';
import 'package:urbanstore/viewmodel/common/app_bar.dart';
import 'package:urbanstore/viewmodel/common/drawer.dart';

class Productsearchfunctionscreen extends StatefulWidget {
  const Productsearchfunctionscreen({super.key});

  @override
  State<Productsearchfunctionscreen> createState() =>
      _ProductsearchfunctionscreenState();
}

class _ProductsearchfunctionscreenState
    extends State<Productsearchfunctionscreen> {
  List<Product> filteredProducts = [];
  String searchQuery = '';
  final List<Product> productList = productListTest;
  @override
  void initState() {
    super.initState();
    filteredProducts = productList;
  }

  void updateSearchQuery(String query) {
    setState(() {
      searchQuery = query;
      filteredProducts = productList
          .where((productList) => productList.name
              .toLowerCase()
              .contains(searchQuery.toLowerCase()))
          .toList();
    });
  }

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
      drawer: CustomDrawer(),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: '商品名で検索',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onChanged: (query) => updateSearchQuery(query),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: filteredProducts.isEmpty
                  ? Center(child: Text('該当する商品がありません。'))
                  : ListView.builder(
                      itemCount: filteredProducts.length,
                      itemBuilder: (context, index) {
                        final product = filteredProducts[index];
                        return ListTile(
                          title: Text(product.name),
                          subtitle: Text('${product.price} 円'),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Itemdetailscreen(
                                    productId: product.id, cart: Cart()),
                              ),
                            );
                          },
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
