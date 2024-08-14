import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  static final DataBaseHelper instance = DataBaseHelper._instance();
  static Database? _database;

  DataBaseHelper._instance();
}
