import 'dart:io';

import 'package:coffe_shop/src/features/map/data/data_source/map_data_source.dart';
import 'package:coffe_shop/src/features/map/data/data_source/savable_map_data_source.dart';
import 'package:coffe_shop/src/features/map/models/dtos/point_dto.dart';
import 'package:coffe_shop/src/features/map/models/point_model.dart';

abstract class IMapRepository {
  Future<List<MapPointModel>> getPointList();
}

class MapRepository implements IMapRepository {
  final IMapDataSource _networkCoffeDataSource;
  final IDBMapDataSource _dbCoffeDataSource;

  const MapRepository(
      {required IMapDataSource networkCoffeDataSource,
      required IDBMapDataSource dbCoffeDataSource})
      : _networkCoffeDataSource = networkCoffeDataSource,
        _dbCoffeDataSource = dbCoffeDataSource;

  @override
  Future<List<MapPointModel>> getPointList() async {
    var dtos = <MapPointDto>[];
    try {
      dtos = await _networkCoffeDataSource.getPoints();
      _dbCoffeDataSource.updatePointList(dtos);
    } on SocketException {
      dtos = await _dbCoffeDataSource.getPointList();
    }
    return dtos.map((e) => MapPointModel.fromDTO(e)).toList();
  }

  
}
