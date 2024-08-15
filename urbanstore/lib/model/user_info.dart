import 'package:urbanstore/model/address.dart';

class UserInfo {
  final String id;
  final String name;
  final String email;
  final String passwordHash;
  final Address? address;
  final String phoneNumber;

  UserInfo({
    required this.id,
    required this.name,
    required this.email,
    required this.passwordHash,
    required this.address,
    required this.phoneNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'passwordHash': passwordHash,
      'address': address?.toMap(),
      'phoneNumber': phoneNumber,
    };
  }

  // fromMap メソッド
  static UserInfo fromMap(Map<String, dynamic> map) {
    return UserInfo(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      passwordHash: map['passwordHash'],
      address: map['address'] != null ? Address.fromMap(map['address']) : null,
      phoneNumber: map['phoneNumber'],
    );
  }
}
