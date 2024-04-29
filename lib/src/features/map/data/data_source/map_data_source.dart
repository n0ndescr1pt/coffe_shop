import 'dart:io';

import 'package:coffe_shop/src/features/map/models/dtos/point_dto.dart';
import 'package:dio/dio.dart';

abstract class IMapDataSource {
  Future<List<MapPointDto>> getPoints();
}

class MapDataSource implements IMapDataSource {
  final Dio _dio;

  const MapDataSource({required Dio dio}) : _dio = dio;

  @override
  Future<List<MapPointDto>> getPoints() async {
    final response = await _dio.get('/locations');
    final List<MapPointDto> pointsDto = [];
    if (response.statusCode == 200) {
      for (var item in response.data['data']) {
        pointsDto.add(MapPointDto.fromJson(item));
      }
      return pointsDto;
    } else {
      throw const SocketException("no wi fi");
    }
  }
}
