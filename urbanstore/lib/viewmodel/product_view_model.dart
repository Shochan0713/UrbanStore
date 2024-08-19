import 'package:flutter/material.dart';
import 'package:urbanstore/model/product.dart';

class ProductSearchViewModel extends ChangeNotifier {
  List<Product> filteredProducts = [];
  String searchQuery = '';
  final List<Product> productList;

  ProductSearchViewModel(this.productList) {
    // 初期状態で全ての製品を表示する
    filteredProducts = productList;
  }

  void updateSearchQuery(String query) {
    searchQuery = query;
    filteredProducts = productList
        .where((product) =>
            product.name.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();
    notifyListeners(); // UIに変更を通知
  }
}
