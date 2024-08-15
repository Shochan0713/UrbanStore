import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:urbanstore/view/product_related/HomeScreen.dart';
import 'package:urbanstore/view/user_management/RegistrationCompleateScreen.dart';
import 'package:urbanstore/viewmodel/common/app_bar.dart';

class UserRegistrationScreen extends StatefulWidget {
  UserRegistrationScreen({super.key});

  @override
  State<UserRegistrationScreen> createState() => _UserRegistrationScreenState();
}

class _UserRegistrationScreenState extends State<UserRegistrationScreen> {
  bool _showTextFields = false;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _email = '';
  String _password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'UserRegistration',
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.home),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'メールアドレス',
                  border: OutlineInputBorder(),
                ),
                // onChanged: (value) {
                //   _email = value;
                // },
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'パスワード',
                  border: OutlineInputBorder(),
                ),
                // onChanged: (value) {
                //   _password = value;
                // },
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan[400],
                  foregroundColor: Colors.black,
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('ユーザー登録'),
                onPressed: () async {
                  try {
                    final User? user = (await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: _emailController.text,
                                password: _passwordController.text))
                        .user;
                    if (user != null)
                      print("ユーザー登録しました${user.email} , ${user.uid}");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Registrationcompleatescreen(),
                      ),
                    );
                  } catch (e) {
                    print("エラー: $e");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
