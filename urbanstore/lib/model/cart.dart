import 'package:urbanstore/model/cart_item.dart';
import 'package:urbanstore/model/product.dart';

class Cart {
  static final Cart _instance = Cart._internal();

  final List<CartItem> _items = [];

  // プライベートコンストラクタ
  Cart._internal();

  // シングルトンインスタンスを取得するためのファクトリコンストラクタ
  factory Cart() {
    return _instance;
  }

  // カート内の商品を取得
  List<CartItem> get items => _items;

  // カートに商品を追加する
  void addToCart(Product product) {
    final existingItem = _items.firstWhere(
        (item) => item.product.id == product.id,
        orElse: () => CartItem(product: product));

    if (!_items.contains(existingItem)) {
      _items.add(existingItem);
    } else {
      existingItem.quantity++;
    }
  }

  // カートから商品を削除する
  void removeFromCart(Product product) {
    final existingItem = _items.firstWhere(
        (item) => item.product.id == product.id,
        orElse: () => CartItem(product: product));

    if (existingItem.quantity > 1) {
      existingItem.quantity--;
    } else {
      _items.remove(existingItem);
    }
  }

  // カート内の商品合計金額を計算する
  double get totalPrice {
    return _items.fold(0,
        (total, current) => total + current.product.price * current.quantity);
  }
}
