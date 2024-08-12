import 'package:urbanstore/model/address.dart';

class User {
  final String id;
  final String name;
  final String email;
  final String passwordHash;
  final Address? address;
  final String phoneNumber;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.passwordHash,
    required this.address,
    required this.phoneNumber,
  });

  bool isPasswordValid(String password) {
    return true;
  }
}
