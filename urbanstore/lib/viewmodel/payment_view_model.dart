import 'package:flutter/foundation.dart';
import 'package:urbanstore/model/order.dart';
import 'package:urbanstore/model/payment_method.dart';
import 'package:urbanstore/model/payment_statusdart.dart';

class PaymentViewModel extends ChangeNotifier {
  PaymentStatus? _paymentStatus;
  String? _errorMessage;

  PaymentStatus? get paymentStatus => _paymentStatus;
  String? get errorMessage => _errorMessage;

  void processPayment(Order order, PaymentMethod paymentMethod) {
    // 支払い処理をここに実装します
    // 成功時
    _paymentStatus = PaymentStatus.COMPLETED;
    notifyListeners();
  }

  void fetchPaymentStatus(String orderId) {
    // 支払いステータス取得処理をここに実装します
    _paymentStatus = PaymentStatus.PENDING; // 仮のステータス
    notifyListeners();
  }
}
