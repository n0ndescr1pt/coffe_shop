import 'dart:async';
import 'dart:developer';

import 'package:coffe_shop/src/app.dart';
import 'package:coffe_shop/src/database/database.dart';
import 'package:coffe_shop/src/features/map/data/data_source/map_data_source.dart';
import 'package:coffe_shop/src/features/map/data/data_source/savable_map_data_source.dart';
import 'package:coffe_shop/src/features/map/data/map_repository.dart';
import 'package:coffe_shop/src/features/menu/bloc/coffe_list_bloc/coffe_list_bloc.dart';
import 'package:coffe_shop/src/features/menu/data/coffe_repository.dart';
import 'package:coffe_shop/src/features/menu/data/data_source/coffe_data_source.dart';
import 'package:coffe_shop/src/features/menu/data/data_source/savable_coffe_data_source.dart';
import 'package:coffe_shop/src/features/order/bloc/order_list_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

void main() {
  runZonedGuarded(() async {
    AndroidYandexMap.useAndroidViewSurface = false;
    WidgetsFlutterBinding.ensureInitialized();
    await initGetIt();
    runApp(const CoffeeShopApp());
  }, (error, stack) {
    log(error.toString(), name: 'App Error', stackTrace: stack);
  });
}

Future<void> initGetIt() async {
  final dio = Dio(
      BaseOptions(baseUrl: "https://coffeeshop.academy.effective.band/api/v1"));
  final database = DBProvider.db.database;
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  GetIt.I.registerSingleton<OrderListBloc>(OrderListBloc({}));
  GetIt.I.registerSingleton<CoffeListBloc>(
    CoffeListBloc(
      coffeRepository: CoffeRepository(
        networkCoffeDataSource: CoffeDataSource(dio: dio),
        dbCoffeDataSource: DbCoffeDataSource(database: database),
      ),
      mapRepository: MapRepository(
        networkCoffeDataSource: MapDataSource(dio: dio),
        dbCoffeDataSource: DbMapDataSource(database: database, prefs: prefs),
      ),
    ),
  );
}
