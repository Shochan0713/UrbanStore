import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ログイン'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'メールアドレス',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'パスワード',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // ログイン処理をここで実行
                String email = _emailController.text;
                String password = _passwordController.text;
                // Login logic here
              },
              child: Text('ログイン'),
            ),
            SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                // パスワードリセット画面へ遷移
              },
              child: Text('パスワードを忘れた場合'),
            ),
            SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                // 新規登録画面へ遷移
              },
              child: Text('新規登録'),
            ),
          ],
        ),
      ),
    );
  }
}
