import 'package:coffe_shop/src/features/menu/models/dto/coffe_dto.dart';
import 'package:coffe_shop/src/features/menu/models/dto/drink_dto.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class ICoffeDataSource {
  Future<List<DrinkDto>> getDrinks();
  Future<List<CoffeDto>> getData();
  Future<Map<int, String>> getCategoryId();
  Future<void> sendOrder(BuildContext context);
}

class CoffeDataSource implements ICoffeDataSource {
  final Dio _dio;

  const CoffeDataSource({required Dio dio}) : _dio = dio;
  @override
  Future<List<DrinkDto>> getDrinks() async {
    final response = await _dio.get('/products');

    final List<DrinkDto> drinkList = [];
    if (response.statusCode == 200) {
      for (var element in response.data['data']) {
        drinkList.add(DrinkDto.fromJson(element));
      }
      return drinkList;
    } else {
      throw Exception('failed to load');
    }
  }

  @override
  Future<List<CoffeDto>> getData() async {
    print(1.1);
    final List<CoffeDto> map = [];

    final listCategory = await getCategoryId();
    print(1.2);
    final List<DrinkDto> listDrinks = await getDrinks();

    listCategory.forEach((key, value) {
      final List<DrinkDto> drinks = [];
      for (int i = 0; i < listDrinks.length; i++) {
        if (listDrinks[i].id == key) {
          drinks.add(
            DrinkDto(
                id: listDrinks[i].id,
                name: listDrinks[i].name,
                image: listDrinks[i].image,
                price: listDrinks[i].price,
                category: listDrinks[i].category,
                productID: listDrinks[i].productID),
          );
        }
      }
      print(1.3);
      map.add(CoffeDto(title: value, drinks: drinks));
    });

    return map;
  }

  @override
  Future<Map<int, String>> getCategoryId() async {
    final response = await _dio.get('/products/categories');

    final Map<int, String> categoryMap = {};

    if (response.statusCode == 200) {
      for (var element in response.data['data']) {
        categoryMap[element['id']] = element['slug'];
      }

      return categoryMap;
    } else {
      throw Exception('failed to load');
    }
  }

  @override
  Future<void> sendOrder(BuildContext context) async {
    final Map<String, dynamic> userData = {
      "positions": {"1": 12},
      "token": ""
    };
    final response = await _dio.post('/orders', data: userData);
    if (response.statusCode == 201) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Заказ создан"),
          duration: Duration(seconds: 2),
        ));
      }
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Возникла ошибка при заказе"),
          duration: Duration(seconds: 2),
        ));
      }
    }
  }
}
