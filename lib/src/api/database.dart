import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb();

    return _database!;
  }

  Future<Database> _initDb() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = "${dir.path}Coffe13.db";
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  void _createDB(Database db, int version) async {
    await db.execute('''
        CREATE TABLE CoffeCategory(
          id INTEGER primary key,
          category_name TEXT
        )
      ''');

    await db.execute('''
        CREATE TABLE Drink(
          product_id integer primary key,
          category text,
          name text,
          image text,
          priceRUB text,
          priceUSD text,
          counter integer,
          category_id integer,
          FOREIGN KEY(category_id) REFERENCES Drink(id)
        )
      ''');
    await db.execute('''
        CREATE TABLE Points(
          point_id integer primary key AUTOINCREMENT,
          adress text,
          latitude text,
          longitude text
        )
      ''');
  }
}
