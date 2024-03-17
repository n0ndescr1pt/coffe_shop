class DrinkModel {
  final int id;
  final String category;
  final String name;
  final String image;
  final String price;

 const DrinkModel(
      {required this.id,
      required this.name,
      required this.image,
      required this.price,
      required this.category});

  factory DrinkModel.fromJson(Map<String, dynamic> json) {
    return DrinkModel(
      name: json['name'],
      image: json['imageUrl'],
      price: json['prices'][0]['value'],
      id: json['category']['id'],
      category: json['category']['slug'],
    );
  }
}
