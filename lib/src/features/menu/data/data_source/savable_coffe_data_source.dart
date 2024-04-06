import 'package:coffe_shop/src/features/menu/models/dto/coffe_dto.dart';
import 'package:coffe_shop/src/features/menu/models/dto/drink_dto.dart';
import 'package:sqflite/sqlite_api.dart';

abstract interface class IDBCoffeDataSource {
  Future<List<CoffeDto>> getCoffeList();
  Future<void> updateCoffeList(List<CoffeDto> coffeList);
}

class DbCoffeDataSource implements IDBCoffeDataSource {
  final Future<Database> _database;
  const DbCoffeDataSource({required Future<Database> database})
      : _database = database;

  @override
  Future<List<CoffeDto>> getCoffeList() async {
    final database = await _database;
    final List<Map<String, dynamic>> queryCategory =
        await database.query("CoffeCategory");
    final List<CoffeDto> coffeList = [];
    for (var element in queryCategory) {
      final List<DrinkDto> drinks = [];

      final List<Map<String, dynamic>> queryDrinks = await database
          .query("Drink", where: "category_id = ?", whereArgs: [element['id']]);
      for (var drink in queryDrinks) {
        drinks.add(DrinkDto.fromMap(drink));
      }
      coffeList.add(CoffeDto.fromMap(element, drinks));
    }
    return coffeList;
  }

  @override
  Future<void> updateCoffeList(List<CoffeDto> coffeList) async {
    final database = await _database;
    await database.delete("CoffeCategory");
    await database.delete("Drink");
    for (var element in coffeList) {
      await database.insert("CoffeCategory", element.toMap());

      for (var drink in element.drinks) {
        await database.insert("Drink", drink.toMap());
      }
    }
  }
}
