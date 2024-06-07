class DrinkDto {
  final int categoryID;
  final String category;
  final String name;
  final String image;
  final String priceRUB;
  final String priceUSD;
  final int productID;
  final int? counter;

  const DrinkDto(
      {required this.categoryID,
      required this.name,
      required this.image,
      required this.priceUSD,
      required this.priceRUB,
      required this.category,
      required this.productID,
      this.counter});

  factory DrinkDto.fromJson(Map<String, dynamic> json) {
    return DrinkDto(
      name: json['name'],
      image: json['imageUrl'],
      priceRUB: json['prices'][0]['value'],
      priceUSD: json['prices'][1]['value'],
      categoryID: json['category']['id'],
      category: json['category']['slug'],
      productID: json['id'],
    );
  }

  factory DrinkDto.fromMap(Map<String, dynamic> map) {
    return DrinkDto(
        categoryID: map["category_id"],
        name: map["name"],
        image: map["image"],
        priceRUB: map['priceRUB'],
        priceUSD: map['priceUSD'],
        category: map["category"],
        productID: map["product_id"],
        counter: map['counter']);
  }

  Map<String, dynamic> toMap() {
    return {
      "category": category,
      "name": name,
      "image": image,
      "priceRUB": priceRUB,
      "priceUSD": priceUSD,
      "product_id": productID,
      "counter": counter ?? 0,
      "category_id": categoryID
    };
  }
}
