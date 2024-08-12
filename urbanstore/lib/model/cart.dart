import 'package:urbanstore/model/cart_item.dart';
import 'package:urbanstore/model/product.dart';
import 'package:urbanstore/model/user.dart';

class Cart {
  final User user;
  final List<CartItem> items;

  Cart({
    required this.user,
    required this.items,
  });

  double calculateTotalAmount() {
    return items.fold(0.0, (sum, item) => sum + item.calculateItemTotal());
  }

  void addItem(Product product, int quantity) {
    // 商品をカートに追加するロジック
  }

  void removeItem(Product product) {
    // 商品をカートから削除するロジック
  }

  int getQuantity(Product product) {
    for (CartItem item in items) {
      if (item.product == product) {
        return item.quantity;
      }
    }
    return 0; // 商品がカートに存在しない場合は0を返す
  }

  void clear() {
    items.clear();
  }
}
