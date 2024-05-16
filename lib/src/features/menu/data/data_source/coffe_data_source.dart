import 'package:coffe_shop/src/features/menu/models/dto/coffe_dto.dart';
import 'package:coffe_shop/src/features/menu/models/dto/drink_dto.dart';
import 'package:dio/dio.dart';
import 'package:coffe_shop/src/api/firebase_api.dart';

abstract class ICoffeDataSource {
  Future<List<DrinkDto>> getDrinks();
  Future<List<CoffeDto>> getData();
  Future<Map<int, String>> getCategoryId();
  Future<bool> sendOrder();
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
    final List<CoffeDto> map = [];

    final listCategory = await getCategoryId();
    final List<DrinkDto> listDrinks = await getDrinks();

    listCategory.forEach((key, value) {
      final List<DrinkDto> drinks = [];
      for (int i = 0; i < listDrinks.length; i++) {
        if (listDrinks[i].categoryID == key) {
          drinks.add(
            DrinkDto(
                categoryID: listDrinks[i].categoryID,
                name: listDrinks[i].name,
                image: listDrinks[i].image,
                price: listDrinks[i].price,
                category: listDrinks[i].category,
                productID: listDrinks[i].productID),
          );
        }
      }
      map.add(CoffeDto(id: key, title: value, drinks: drinks));
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
  Future<bool> sendOrder() async {
    final String token = await FirebaseApi().initNotifications()??"";
    print(token);
    print("sadadasdadad");
    final Map<String, dynamic> userData = {
      "positions": {"1": 12},
      "token": token
    };
    final response = await _dio.post('/orders', data: userData);
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
