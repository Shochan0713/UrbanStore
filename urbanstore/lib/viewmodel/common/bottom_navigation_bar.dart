import 'package:flutter/material.dart';
import 'package:urbanstore/model/cart.dart';
import 'package:urbanstore/view/cart_purchase_related/CartManagementScreen.dart';
import 'package:urbanstore/view/product_related/HomeScreen.dart';
import 'package:urbanstore/view/user_management/UserInfo.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int? currentIndex;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
  });

  void _onItemTaped(BuildContext context, int index) {
    if (index == currentIndex) {
      return;
    }
    Widget nextScreen;
    switch (index) {
      case 0:
        nextScreen = HomeScreen();
        break;
      case 1:
        nextScreen = Cartmanagementscreen(cart: Cart());
        break;
      case 2:
        nextScreen = const Userinfo();
        break;
      default:
        return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => nextScreen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex ?? 0, // currentIndexがnullなら-1を設定
      onTap: (index) => _onItemTaped(context, index),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
        BottomNavigationBarItem(icon: Icon(Icons.person_sharp), label: 'Person')
      ],
    );
  }
}
