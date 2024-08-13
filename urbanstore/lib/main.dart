import 'package:flutter/material.dart';
import 'package:urbanstore/view/user_management/LoginScreen.dart';

void main() {
  runApp(const UrbanStore());
}

class UrbanStore extends StatelessWidget {
  const UrbanStore({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-commerce App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(),
    );
  }
}
