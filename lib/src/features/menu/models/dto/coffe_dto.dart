
import 'package:coffe_shop/src/features/menu/models/dto/drink_dto.dart';

class CoffeDto {
  final String title;
  final List<DrinkDto> drinks;

  CoffeDto({
    required this.title,
    required this.drinks,
  });
}
