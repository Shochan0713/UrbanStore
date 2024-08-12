import 'package:flutter/foundation.dart';
import 'package:urbanstore/model/oder_status.dart';
import 'package:urbanstore/model/order.dart';
import 'package:urbanstore/model/cart.dart';
import 'package:urbanstore/model/user.dart';

class OrderViewModel extends ChangeNotifier {
  List<Order> _orderList = [];
  Order? _selectedOrder;
  OrderStatus? _orderStatus;
  String? _errorMessage;

  List<Order> get orderList => _orderList;
  Order? get selectedOrder => _selectedOrder;
  OrderStatus? get orderStatus => _orderStatus;
  String? get errorMessage => _errorMessage;

  void fetchOrderList(String userId) {
    // 注文リスト取得処理をここに実装します
    // 仮のデータ
    _orderList = [
      Order(
          id: '1',
          user: User(
              id: userId,
              name: '',
              email: '',
              passwordHash: '',
              address: 'abc',
              phoneNumber: ''),
          items: [],
          totalAmount: 0,
          status: OrderStatus.PENDING,
          orderDate: DateTime.now())
    ];
    notifyListeners();
  }

  void placeOrder(Cart cart) {
    // 注文確定処理をここに実装します
    _orderStatus = OrderStatus.COMPLETED;
    notifyListeners();
  }

  void cancelOrder(String orderId) {
    // 注文キャンセル処理をここに実装します
    _orderStatus = OrderStatus.CANCELLED;
    notifyListeners();
  }
}
