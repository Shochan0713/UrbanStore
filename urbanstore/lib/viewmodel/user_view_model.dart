// import 'package:flutter/foundation.dart';
// import 'package:urbanstore/model/user_info.dart';

// class UserViewModel extends ChangeNotifier {
//   UserInfo? _user;
//   bool _loginState = false;
//   String? _errorMessage;

//   UserInfo? get user => _user;
//   bool get loginState => _loginState;
//   String? get errorMessage => _errorMessage;

//   void login(String email, String password) {
//     // ログイン処理のロジックをここに実装します
//     // 成功した場合:
//     _user = UserInfo(
//         id: '',
//         name: '',
//         email: '',
//         passwordHash: '',
//         address: null,
//         phoneNumber: ''); // 仮のユーザー情報
//     _loginState = true;
//     _errorMessage = null;
//     notifyListeners();
//   }

//   void logout() {
//     _user = null;
//     _loginState = false;
//     notifyListeners();
//   }

//   void registerUser(UserInfo user) {
//     // ユーザー登録処理のロジックをここに実装します
//     _user = user;
//     _loginState = true;
//     notifyListeners();
//   }

//   void updateUserDetails(UserInfo user) {
//     // ユーザー情報更新処理をここに実装します
//     _user = user;
//     notifyListeners();
//   }
// }
