// ignore_for_file: file_names, use_build_context_synchronously, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:urbanstore/view/product_related/HomeScreen.dart';
import 'package:urbanstore/view/user_management/UserRegistrationScreen.dart';
import 'package:urbanstore/viewmodel/common/app_bar.dart';
import 'package:urbanstore/viewmodel/common/drawer.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Login',
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.home),
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'メールアドレス',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'パスワード',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                try {
                  final User? user = (await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: _emailController.text,
                              password: _passwordController.text))
                      .user;
                  if (user != null) {
                    print("ログインしました　${user.email} , ${user.uid}");
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                } catch (e) {
                  // ignore: duplicate_ignore
                  // ignore: avoid_print
                  print(e);
                }
              },
              child: const Text('ログイン'),
            ),
            const SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                // パスワードリセット画面へ遷移
              },
              child: const Text('パスワードを忘れた場合'),
            ),
            const SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserRegistrationScreen(),
                  ),
                );
              },
              child: const Text('新規登録'),
            ),
          ],
        ),
      ),
    );
  }
}
