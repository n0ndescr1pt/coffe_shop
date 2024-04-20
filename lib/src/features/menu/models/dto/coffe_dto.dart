import 'package:coffe_shop/src/features/menu/models/dto/drink_dto.dart';

class CoffeDto {
  final int id;
  final String title;
  final List<DrinkDto> drinks;

  CoffeDto({
    required this.title,
    required this.id,
    required this.drinks,
  });

  factory CoffeDto.fromMap(Map<String, dynamic> map, List<DrinkDto> list) {
    return CoffeDto(
      id: map['id'],
      title: map["category_name"],
      drinks: list,
    );
  }

  Map<String, dynamic> toMap() {
    return {"category_name": title};
  }

  @override
  String toString() {
    return "$id $title";
  }
}
