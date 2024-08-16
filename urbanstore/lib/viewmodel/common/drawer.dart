import 'package:flutter/material.dart';
import 'package:urbanstore/model/cart.dart';
import 'package:urbanstore/view/cart_purchase_related/CartManagementScreen.dart';
import 'package:urbanstore/view/product_related/HomeScreen.dart';
import 'package:urbanstore/view/product_related/ProductSearchFunctionScreen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: [
        DrawerHeader(
          decoration: BoxDecoration(color: Colors.cyan[200]),
          child: const Center(
            child: Text('メニュー'),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('ホーム'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.search),
          title: const Text('検索'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Productsearchfunctionscreen(),
              ),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.shopping_cart),
          title: const Text('カート'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Cartmanagementscreen(
                  cart: Cart(),
                ),
              ),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('設定'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ]),
    );
  }
}
