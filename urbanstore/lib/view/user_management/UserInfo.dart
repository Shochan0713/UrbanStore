// ignore_for_file: file_names, avoid_print, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart'; // 既存の FirebaseAuth クラスのインポート
import 'package:cloud_firestore/cloud_firestore.dart'; // Firestore クラスのインポート
import 'package:flutter/material.dart'; // Flutter のマテリアルデザイン関連のインポート
import 'package:urbanstore/view/order_management/OrderHistoryDisplayScreen.dart';
import 'package:urbanstore/view/product_related/HomeScreen.dart'; // 自作の HomeScreen のインポート
import 'package:urbanstore/view/user_management/LoginScreen.dart'; // 自作の LoginScreen のインポート
import 'package:urbanstore/view/user_management/UserInfoRegistration.dart'; // 自作の UserInfoRegistration のインポート
import 'package:urbanstore/viewmodel/common/app_bar.dart'; // 自作の CustomAppBar のインポート
import 'package:urbanstore/model/user_info.dart' as my_user_info;
import 'package:urbanstore/viewmodel/common/drawer.dart'; // `UserInfo` を `my_user_info` という名前でインポート

class Userinfo extends StatefulWidget {
  const Userinfo({super.key});

  @override
  State<Userinfo> createState() => _UserinfoState();
}

class _UserinfoState extends State<Userinfo> {
  my_user_info.UserInfo? _userInfo; // `my_user_info.UserInfo` を使用
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _fetchUserInfo();
  }

  Future<void> _fetchUserInfo() async {
    final userId = FirebaseAuth.instance.currentUser?.uid;

    if (userId != null) {
      try {
        final docSnapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .get();
        if (docSnapshot.exists) {
          setState(() {
            _userInfo = my_user_info.UserInfo.fromMap(
                docSnapshot.data()!); // `my_user_info.UserInfo` を使用
            _loading = false;
          });
        } else {
          setState(() {
            _userInfo = null; // ここで問題なし
            _loading = false;
          });
        }
      } catch (e) {
        print('Error fetching user info: $e');
        setState(() {
          _loading = false;
        });
      }
    } else {
      setState(() {
        _userInfo = null; // ここで問題なし
        _loading = false;
      });
    }
  }

  void _checkUser() {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      Navigator.pushReplacementNamed(context, '/login'); // ログイン画面へリダイレクト
    }
  }

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: CustomAppBar(
        title: 'ユーザー情報',
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
        child: _loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Center(
                    child: user != null
                        ? Text('メールアドレス: ${user.email}')
                        : const Text('メールアドレスなし'),
                  ),
                  const SizedBox(height: 16),
                  _userInfo != null
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('名前: ${_userInfo!.name}'),
                            Text(
                                '住所: ${_userInfo!.address?.street}, ${_userInfo!.address?.city}, ${_userInfo!.address?.state}, ${_userInfo!.address?.postalCode}, ${_userInfo!.address?.country}'),
                            Text('電話番号: ${_userInfo!.phoneNumber}'),
                          ],
                        )
                      : const Text('未登録です。'),
                  ElevatedButton(
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const Userinforegistrationscreen(),
                        ),
                      );
                    },
                    child: const Text('ユーザー情報登録画面へ'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );
                    },
                    child: const Text('Home画面へ'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OrderHistoryDisplayScreen(),
                          ),
                        );
                      } catch (e) {
                        print("ログアウトに失敗しました: $e");
                      }
                    },
                    child: const Text('購入履歴'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        await FirebaseAuth.instance.signOut();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      } catch (e) {
                        print("ログアウトに失敗しました: $e");
                      }
                    },
                    child: const Text('ログアウト'),
                  ),
                ],
              ),
      ),
    );
  }
}
