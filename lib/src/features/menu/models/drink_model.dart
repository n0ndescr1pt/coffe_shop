import 'package:coffe_shop/src/features/menu/models/dto/drink_dto.dart';

class DrinkModel {
  final int id;
  final String category;
  final String name;
  final String image;
  final String priceRUB;
  final String priceUSD;
  final int productID;
  final int? counter;

  const DrinkModel(
      {required this.id,
      required this.name,
      required this.image,
      required this.priceRUB,
      required this.priceUSD,
      required this.category,
      required this.productID,
      this.counter});

  factory DrinkModel.fromDto(DrinkDto dto) {
    return DrinkModel(
      name: dto.name,
      image: dto.image,
      priceRUB: dto.priceRUB,
      priceUSD: dto.priceUSD,
      id: dto.categoryID,
      category: dto.category,
      productID: dto.productID,
    );
  }

  @override
  String toString() {
    return "name: $name counter: $counter";
  }
}
