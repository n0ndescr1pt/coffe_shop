import 'package:coffe_shop/src/features/menu/models/drink_model.dart';
import 'package:flutter/material.dart';

class CoffeModel {
  final String title;
  final GlobalKey columnKey;
  final GlobalKey rowKey;
  final List<DrinkModel> drinks;

  CoffeModel(
      {required this.title,
      required this.columnKey,
      required this.rowKey,
      required this.drinks});
}
