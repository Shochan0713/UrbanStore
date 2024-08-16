import 'package:flutter/material.dart';
import 'package:urbanstore/view/product_related/HomeScreen.dart';
import 'package:urbanstore/viewmodel/common/app_bar.dart';
import 'package:urbanstore/viewmodel/common/drawer.dart';

class Purchasecompleatescreen extends StatelessWidget {
  const Purchasecompleatescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Home',
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.home),
          ),
        ],
      ),
      drawer: CustomDrawer(),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: Text(
                '購入が完了しました。',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
              },
              child: const Text('Home画面へ'),
            ),
          ],
        ),
      ),
    );
  }
}
