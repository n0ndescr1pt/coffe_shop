import 'package:coffe_shop/src/features/menu/data/data_source/coffe_data_source.dart';
import 'package:coffe_shop/src/features/menu/models/coffee_model.dart';
import 'package:coffe_shop/src/features/menu/models/dto/coffe_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class ICoffeRepository {
  Future<List<CoffeModel>> fetchData();
  Future<void> sendOrder(BuildContext context);
}

class CoffeRepository implements ICoffeRepository {
  final ICoffeDataSource _networkCoffeDataSource;

  const CoffeRepository({required ICoffeDataSource networkCoffeDataSource})
      : _networkCoffeDataSource = networkCoffeDataSource;

  @override
  Future<List<CoffeModel>> fetchData() async {
    var dtos = <CoffeDto>[];
    try {
      print(1);
      dtos = await _networkCoffeDataSource.getData();
      print(2);
    } catch (e) {
      print(e);
    }
    return dtos.map((e) => CoffeModel.fromDto(e)).toList();
  }

  @override
  Future<void> sendOrder(BuildContext context) async {
    await _networkCoffeDataSource.sendOrder(context);
  }
}
