// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urbanstore/model/cart.dart';
import 'package:urbanstore/model/product_list.dart';
import 'package:urbanstore/view/product_related/ItemDetailScreen.dart';
import 'package:urbanstore/viewmodel/common/app_bar.dart';
import 'package:urbanstore/viewmodel/common/bottom_navigation_bar.dart';
import 'package:urbanstore/viewmodel/common/drawer.dart';
import 'package:urbanstore/viewmodel/product_view_model.dart';

class Productsearchfunctionscreen extends StatelessWidget {
  const Productsearchfunctionscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductSearchViewModel(productListTest),
      child: Scaffold(
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
            children: [
              Consumer<ProductSearchViewModel>(
                builder: (context, viewModel, child) {
                  return TextField(
                    decoration: InputDecoration(
                      hintText: '商品名で検索',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onChanged: (query) => viewModel.updateSearchQuery(query),
                  );
                },
              ),
              const SizedBox(height: 16.0),
              Expanded(
                child: Consumer<ProductSearchViewModel>(
                  builder: (context, viewModel, child) {
                    return viewModel.filteredProducts.isEmpty
                        ? const Center(child: Text('該当する商品がありません。'))
                        : ListView.builder(
                            itemCount: viewModel.filteredProducts.length,
                            itemBuilder: (context, index) {
                              final product = viewModel.filteredProducts[index];
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
                          );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
