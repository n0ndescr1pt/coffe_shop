import 'package:coffe_shop/src/features/map/models/dtos/point_dto.dart';

import 'package:sqflite/sqlite_api.dart';

abstract interface class IDBMapDataSource {
  Future<List<MapPointDto>> getPointList();
  Future<void> updatePointList(List<MapPointDto> mapPoints);
}

class DbMapDataSource implements IDBMapDataSource {
  final Future<Database> _database;
  const DbMapDataSource({required Future<Database> database})
      : _database = database;

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
  Future<void> updatePointList(List<MapPointDto> mapPoints) async  {
    final database = await _database;
      await database.delete("Points");

    for (var element in mapPoints) {
      await database.insert("Points", element.toMap());
      
    }
  }
}
