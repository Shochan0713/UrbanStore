import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:urbanstore/firebase_options.dart';
import 'package:urbanstore/view/user_management/LoginScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
