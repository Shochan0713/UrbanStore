import 'package:flutter/foundation.dart';
import 'package:urbanstore/model/product.dart';

class ProductViewModel extends ChangeNotifier {
  List<Product> _productList = [];
  Product? _selectedProduct;
  String? _errorMessage;

  List<Product> get productList => _productList;
  Product? get selectedProduct => _selectedProduct;
  String? get errorMessage => _errorMessage;

  void fetchProductList() {
    // 商品リスト取得処理をここに実装します
    // 仮のデータ
    _productList = [
      Product(
        id: '123',
        name: 'Example Product',
        price: 29.99,
        description: 'This is an example product.',
        imageUrl: 'http://example.com/image.jpg',
        stockQuantity: 10,
      )
    ];
    notifyListeners();
  }

  void selectProduct(String productId) {
    try {
      _selectedProduct = _productList.firstWhere(
        (product) => product.id == productId,
        orElse: () => throw Exception('Product not found'),
      );
    } catch (e) {
      // エラーハンドリング
      _selectedProduct = null; // または適切なデフォルト処理
    }
    notifyListeners();
  }

  void searchProducts(String query) {
    // 検索処理をここに実装します
    _productList =
        _productList.where((product) => product.name.contains(query)).toList();
    notifyListeners();
  }
}
