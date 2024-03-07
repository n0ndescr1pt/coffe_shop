import 'package:coffe_shop/src/features/menu/models/coffee_model.dart';
import 'package:coffe_shop/src/features/menu/models/drink_model.dart';
import 'package:coffe_shop/src/features/menu/view/menu_screen.dart';
import 'package:coffe_shop/src/theme/light_theme.dart';
import 'package:flutter/material.dart';

class CoffeeShopApp extends StatefulWidget {
  const CoffeeShopApp({super.key});

  @override
  State<CoffeeShopApp> createState() => _CoffeeShopAppState();
}

class _CoffeeShopAppState extends State<CoffeeShopApp> {
  late List<CoffeModel> _a;
  @override
  void initState() {
    super.initState();
    _a = [
      CoffeModel(
          title: "Горячие напитки",
          columnKey: GlobalKey(),
          rowKey: GlobalKey(),
          drinks: [
            DrinkModel(
                name: "name 1",
                image:
                    'https://avatars.mds.yandex.net/i?id=3582d80bd3d144efb4a11c84197d51d9d49bc46d-12525650-images-thumbs&n=13',
                price: 123),
            DrinkModel(
                name: "name 2",
                image:
                    'https://avatars.mds.yandex.net/i?id=3582d80bd3d144efb4a11c84197d51d9d49bc46d-12525650-images-thumbs&n=13',
                price: 123)
          ]),
      CoffeModel(
          title: "Капучино",
          columnKey: GlobalKey(),
          rowKey: GlobalKey(),
          drinks: [
            DrinkModel(
                name: "name 1",
                image:
                    'https://avatars.mds.yandex.net/i?id=3582d80bd3d144efb4a11c84197d51d9d49bc46d-12525650-images-thumbs&n=13',
                price: 123),
            DrinkModel(
                name: "name 2",
                image:
                    'https://avatars.mds.yandex.net/i?id=3582d80bd3d144efb4a11c84197d51d9d49bc46d-12525650-images-thumbs&n=13',
                price: 123)
          ]),
      CoffeModel(
          title: "Раф",
          columnKey: GlobalKey(),
          rowKey: GlobalKey(),
          drinks: [
            DrinkModel(
                name: "name 1",
                image:
                    'https://avatars.mds.yandex.net/i?id=3582d80bd3d144efb4a11c84197d51d9d49bc46d-12525650-images-thumbs&n=13',
                price: 123),
            DrinkModel(
                name: "name 2",
                image:
                    'https://avatars.mds.yandex.net/i?id=3582d80bd3d144efb4a11c84197d51d9d49bc46d-12525650-images-thumbs&n=13',
                price: 123)
          ]),
      CoffeModel(
          title: "Латте",
          columnKey: GlobalKey(),
          rowKey: GlobalKey(),
          drinks: [
            DrinkModel(
                name: "name 1",
                image:
                    'https://avatars.mds.yandex.net/i?id=3582d80bd3d144efb4a11c84197d51d9d49bc46d-12525650-images-thumbs&n=13',
                price: 123),
            DrinkModel(
                name: "name 2",
                image:
                    'https://avatars.mds.yandex.net/i?id=3582d80bd3d144efb4a11c84197d51d9d49bc46d-12525650-images-thumbs&n=13',
                price: 123)
          ]),
      CoffeModel(
          title: "Закуски",
          columnKey: GlobalKey(),
          rowKey: GlobalKey(),
          drinks: [
            DrinkModel(
                name: "name 1",
                image:
                    'https://avatars.mds.yandex.net/i?id=3582d80bd3d144efb4a11c84197d51d9d49bc46d-12525650-images-thumbs&n=13',
                price: 123),
            DrinkModel(
                name: "name 1",
                image:
                    'https://avatars.mds.yandex.net/i?id=3582d80bd3d144efb4a11c84197d51d9d49bc46d-12525650-images-thumbs&n=13',
                price: 123),
            DrinkModel(
                name: "name 1",
                image:
                    'https://avatars.mds.yandex.net/i?id=3582d80bd3d144efb4a11c84197d51d9d49bc46d-12525650-images-thumbs&n=13',
                price: 123),
            DrinkModel(
                name: "name 2",
                image:
                    'https://avatars.mds.yandex.net/i?id=3582d80bd3d144efb4a11c84197d51d9d49bc46d-12525650-images-thumbs&n=13',
                price: 123)
          ]),
      CoffeModel(
          title: "Качупино",
          columnKey: GlobalKey(),
          rowKey: GlobalKey(),
          drinks: [
            DrinkModel(
                name: "name 1",
                image:
                    'https://avatars.mds.yandex.net/i?id=3582d80bd3d144efb4a11c84197d51d9d49bc46d-12525650-images-thumbs&n=13',
                price: 123),
            DrinkModel(
                name: "name 1",
                image:
                    'https://avatars.mds.yandex.net/i?id=3582d80bd3d144efb4a11c84197d51d9d49bc46d-12525650-images-thumbs&n=13',
                price: 123),
            DrinkModel(
                name: "name 2",
                image:
                    'https://avatars.mds.yandex.net/i?id=3582d80bd3d144efb4a11c84197d51d9d49bc46d-12525650-images-thumbs&n=13',
                price: 123)
          ]),
      CoffeModel(
          title: "3",
          columnKey: GlobalKey(),
          rowKey: GlobalKey(),
          drinks: [
            DrinkModel(
                name: "name 1",
                image:
                    'https://avatars.mds.yandex.net/i?id=3582d80bd3d144efb4a11c84197d51d9d49bc46d-12525650-images-thumbs&n=13',
                price: 123),
            DrinkModel(
                name: "name 2",
                image:
                    'https://avatars.mds.yandex.net/i?id=3582d80bd3d144efb4a11c84197d51d9d49bc46d-12525650-images-thumbs&n=13',
                price: 123)
          ]),
      CoffeModel(
          title: "4",
          columnKey: GlobalKey(),
          rowKey: GlobalKey(),
          drinks: [
            DrinkModel(
                name: "name 1",
                image:
                    'https://avatars.mds.yandex.net/i?id=3582d80bd3d144efb4a11c84197d51d9d49bc46d-12525650-images-thumbs&n=13',
                price: 123),
            DrinkModel(
                name: "name 2",
                image:
                    'https://avatars.mds.yandex.net/i?id=3582d80bd3d144efb4a11c84197d51d9d49bc46d-12525650-images-thumbs&n=13',
                price: 123)
          ]),
      CoffeModel(
          title: "5",
          columnKey: GlobalKey(),
          rowKey: GlobalKey(),
          drinks: [
            DrinkModel(
                name: "name 1",
                image:
                    'https://avatars.mds.yandex.net/i?id=3582d80bd3d144efb4a11c84197d51d9d49bc46d-12525650-images-thumbs&n=13',
                price: 123),
            DrinkModel(
                name: "name 2",
                image:
                    'https://avatars.mds.yandex.net/i?id=3582d80bd3d144efb4a11c84197d51d9d49bc46d-12525650-images-thumbs&n=13',
                price: 123)
          ]),
      CoffeModel(
          title: "6",
          columnKey: GlobalKey(),
          rowKey: GlobalKey(),
          drinks: [
            DrinkModel(
                name: "name 1",
                image:
                    'https://avatars.mds.yandex.net/i?id=3582d80bd3d144efb4a11c84197d51d9d49bc46d-12525650-images-thumbs&n=13',
                price: 123),
            DrinkModel(
                name: "name 2",
                image:
                    'https://avatars.mds.yandex.net/i?id=3582d80bd3d144efb4a11c84197d51d9d49bc46d-12525650-images-thumbs&n=13',
                price: 123)
          ])
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      home: MenuScreen(coffeModel: _a),
    );
  }
}
