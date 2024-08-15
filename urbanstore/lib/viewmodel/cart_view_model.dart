import 'package:flutter/foundation.dart';
import 'package:urbanstore/model/cart.dart';
import 'package:urbanstore/model/product.dart';

class CartViewModel extends ChangeNotifier {
  Cart? _cart;
  double _totalAmount = 0.0;
  String? _errorMessage;

  Cart? get cart => _cart;
  double get totalAmount => _totalAmount;
  String? get errorMessage => _errorMessage;

  // void addItemToCart(Product product, int quantity) {
  //   // カートにアイテムを追加する処理をここに実装します
  //   _cart?.addItem(product, quantity);
  //   _totalAmount += product.price * quantity;
  //   notifyListeners();
  // }

  // void removeItemFromCart(Product product) {
  //   // カートからアイテムを削除する処理をここに実装します
  //   _cart?.removeItem(product);
  //   _totalAmount -= product.price * (_cart?.getQuantity(product) ?? 0);
  //   notifyListeners();
  // }

  // void clearCart() {
  //   _cart?.clear();
  //   _totalAmount = 0.0;
  //   notifyListeners();
  // }

  // void checkout() {
  //   // チェックアウト処理をここに実装します
  //   // 支払いページに進むなどの処理
  //   notifyListeners();
  // }
}
