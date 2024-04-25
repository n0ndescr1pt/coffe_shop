import 'dart:io';

import 'package:coffe_shop/src/features/map/data/data_source/map_data_source.dart';
import 'package:coffe_shop/src/features/map/data/data_source/savable_map_data_source.dart';
import 'package:coffe_shop/src/features/map/models/dtos/point_dto.dart';
import 'package:coffe_shop/src/features/map/models/point_model.dart';

abstract class IMapRepository {
  Future<List<MapPointModel>> getPointList();
    Future<String> getSavedAdress();
  Future<String> setAdress(String adress);
}

class MapRepository implements IMapRepository {
  final IMapDataSource _networkMapDataSource;
  final IDBMapDataSource _dbMapDataSource;

  const MapRepository(
      {required IMapDataSource networkCoffeDataSource,
      required IDBMapDataSource dbCoffeDataSource})
      : _networkMapDataSource = networkCoffeDataSource,
        _dbMapDataSource = dbCoffeDataSource;

  @override
  Future<List<MapPointModel>> getPointList() async {
    var dtos = <MapPointDto>[];
    try {
      dtos = await _networkMapDataSource.getPoints();
      _dbMapDataSource.updatePointList(dtos);
    } on SocketException {
      dtos = await _dbMapDataSource.getPointList();
    }
    return dtos.map((e) => MapPointModel.fromDTO(e)).toList();
  }
  
  @override
  Future<String> getSavedAdress() async {
   return await _dbMapDataSource.getSavedAdress();
  }
  
  @override
  Future<String> setAdress(String adress) async {
    return await _dbMapDataSource.setAdress(adress);
  }

  
}
