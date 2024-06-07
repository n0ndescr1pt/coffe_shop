import 'package:coffe_shop/src/features/menu/models/drink_model.dart';
import 'package:coffe_shop/src/features/menu/models/dto/coffe_dto.dart';

class CoffeModel {
  final String title;
  final List<DrinkModel> drinks;

  CoffeModel({
    required this.title,
    required this.drinks,
  });

  factory CoffeModel.fromDto(CoffeDto coffeeDto) {
    final List<DrinkModel> drinks = [];
    for (var drink in coffeeDto.drinks) {
      drinks.add(DrinkModel.fromDto(drink));
    }

    // Возвращаем новый экземпляр CoffeeModel
    return CoffeModel(
      title: coffeeDto.title,
      drinks: drinks,
    );
  }
}
