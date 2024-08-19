import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart'; // Add this for BuildContext
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:urbanstore/model/address.dart';
import 'package:urbanstore/model/user_info.dart' as my_user_info;

class UserViewModel extends ChangeNotifier {
  my_user_info.UserInfo? _userInfo;
  bool _loading = true;
  User? _user;

  UserViewModel() {
    _user = FirebaseAuth.instance.currentUser;
    _fetchUserInfo();
  }

  my_user_info.UserInfo? get userInfo => _userInfo;
  bool get loading => _loading;
  User? get user => _user;

  Future<void> _fetchUserInfo() async {
    final userId = _user?.uid;

    if (userId != null) {
      try {
        final docSnapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .get();
        if (docSnapshot.exists) {
          _userInfo = my_user_info.UserInfo.fromMap(docSnapshot.data()!);
        }
      } catch (e) {
        print('Error fetching user info: $e');
      } finally {
        _loading = false;
        notifyListeners();
      }
    } else {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      _user = null;
      notifyListeners();
    } catch (e) {
      print("ログアウトに失敗しました: $e");
    }
  }

  final _nameController = TextEditingController();
  final _streetController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _postalCodeController = TextEditingController();
  final _countryController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  TextEditingController get nameController => _nameController;
  TextEditingController get streetController => _streetController;
  TextEditingController get cityController => _cityController;
  TextEditingController get stateController => _stateController;
  TextEditingController get postalCodeController => _postalCodeController;
  TextEditingController get countryController => _countryController;
  TextEditingController get phoneNumberController => _phoneNumberController;

  Future<void> saveUserInfo(BuildContext context) async {
    final name = _nameController.text;
    final street = _streetController.text;
    final city = _cityController.text;
    final state = _stateController.text;
    final postalCode = _postalCodeController.text;
    final country = _countryController.text;
    final phoneNumber = _phoneNumberController.text;

    final userId = _user?.uid;

    if (userId != null) {
      final address = Address(
        street: street,
        city: city,
        state: state,
        postalCode: postalCode,
        country: country,
      );

      final user = my_user_info.UserInfo(
        id: userId,
        name: name,
        email: _user?.email ?? '',
        passwordHash: '',
        address: address,
        phoneNumber: phoneNumber,
      );

      try {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .set(user.toMap());

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('ユーザー情報が保存されました')),
        );

        Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('ユーザー情報の保存に失敗しました: $e')),
        );
      }
    }
  }
}
