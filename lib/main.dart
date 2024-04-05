import 'dart:async';
import 'dart:developer';

import 'package:coffe_shop/src/app.dart';
import 'package:coffe_shop/src/features/menu/bloc/coffe_list_bloc/coffe_list_bloc.dart';
import 'package:coffe_shop/src/features/menu/data/coffe_repository.dart';
import 'package:coffe_shop/src/features/menu/data/data_source/coffe_data_source.dart';
import 'package:coffe_shop/src/features/order/bloc/order_list_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  initGetIt();
  runZonedGuarded(() => runApp(const CoffeeShopApp()), (error, stack) {
    log(error.toString(), name: 'App Error', stackTrace: stack);
  });
}

void initGetIt() {
  final dio = Dio(
      BaseOptions(baseUrl: "https://coffeeshop.academy.effective.band/api/v1"));
  GetIt.I.registerSingleton<OrderListBloc>(OrderListBloc({}));
  GetIt.I.registerSingleton<CoffeListBloc>(CoffeListBloc(
      coffeRepository:
          CoffeRepository(networkCoffeDataSource: CoffeDataSource(dio: dio))));
}
