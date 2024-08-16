// ignore_for_file: file_names, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:urbanstore/model/address.dart';
import 'package:urbanstore/model/user_info.dart' as user_model;
import 'package:urbanstore/viewmodel/common/drawer.dart';

class Userinforegistrationscreen extends StatefulWidget {
  const Userinforegistrationscreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _UserinforegistrationscreenState createState() =>
      _UserinforegistrationscreenState();
}

class _UserinforegistrationscreenState
    extends State<Userinforegistrationscreen> {
  final _nameController = TextEditingController();
  final _streetController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _postalCodeController = TextEditingController();
  final _countryController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  Future<void> _saveUserInfo() async {
    final name = _nameController.text;
    final street = _streetController.text;
    final city = _cityController.text;
    final state = _stateController.text;
    final postalCode = _postalCodeController.text;
    final country = _countryController.text;
    final phoneNumber = _phoneNumberController.text;

    final userId = FirebaseAuth.instance.currentUser?.uid;

    if (userId != null) {
      // Address オブジェクトを作成
      final address = Address(
        street: street,
        city: city,
        state: state,
        postalCode: postalCode,
        country: country,
      );

      // UserInfo オブジェクトを作成
      final user = user_model.UserInfo(
        id: userId,
        name: name,
        email: FirebaseAuth.instance.currentUser?.email ?? '',
        passwordHash: '', // パスワードは Firebase Auth で管理されているため、空のままにします
        address: address,
        phoneNumber: phoneNumber,
      );

      try {
        // Firestore にユーザー情報を保存
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .set(user.toMap());

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('ユーザー情報が保存されました')),
        );

        // 登録後にホーム画面に遷移するなど、必要な処理を追加
        Navigator.pop(context); // 戻る
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('ユーザー情報の保存に失敗しました: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ユーザー情報登録')),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: '名前'),
            ),
            TextField(
              controller: _streetController,
              decoration: const InputDecoration(labelText: '住所（街）'),
            ),
            TextField(
              controller: _cityController,
              decoration: const InputDecoration(labelText: '住所（市）'),
            ),
            TextField(
              controller: _stateController,
              decoration: const InputDecoration(labelText: '住所（州）'),
            ),
            TextField(
              controller: _postalCodeController,
              decoration: const InputDecoration(labelText: '郵便番号'),
            ),
            TextField(
              controller: _countryController,
              decoration: const InputDecoration(labelText: '国'),
            ),
            TextField(
              controller: _phoneNumberController,
              decoration: const InputDecoration(labelText: '電話番号'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveUserInfo,
              child: const Text('保存'),
            ),
          ],
        ),
      ),
    );
  }
}
