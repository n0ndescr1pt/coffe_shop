import 'package:coffe_shop/src/features/map/models/dtos/point_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:sqflite/sqlite_api.dart';

abstract interface class IDBMapDataSource {
  Future<List<MapPointDto>> getPointList();
  Future<String> getSavedAdress();
  Future<String> setAdress(String adress);
  Future<void> updatePointList(List<MapPointDto> mapPoints);
}

class DbMapDataSource implements IDBMapDataSource {
  final SharedPreferences _prefs;
  final Future<Database> _database;
  const DbMapDataSource(
      {required Future<Database> database, required SharedPreferences prefs})
      : _database = database,
        _prefs = prefs;

  @override
  Future<List<MapPointDto>> getPointList() async {
    final database = await _database;
    final List<Map<String, dynamic>> queryCategory =
        await database.query("Points");
    final List<MapPointDto> pointList = [];
    for (var element in queryCategory) {
      pointList.add(MapPointDto.fromMap(element));
    }
    return pointList;
  }

  @override
  Future<String> getSavedAdress() async {
    return _prefs.getString('adress') ?? "Ленина, 15";
  }

  @override
  Future<String> setAdress(String adress) async {
   await _prefs.setString('adress', adress);
    return adress;
  }

  @override
  Future<void> updatePointList(List<MapPointDto> mapPoints) async {
    final database = await _database;
    await database.delete("Points");

    for (var element in mapPoints) {
      await database.insert("Points", element.toMap());
    }
  }
}
