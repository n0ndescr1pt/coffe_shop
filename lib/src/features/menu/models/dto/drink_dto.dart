class DrinkDto {
  final int categoryID;
  final String category;
  final String name;
  final String image;
  final String price;
  final int productID;
  final int? counter;

  const DrinkDto(
      {required this.categoryID,
      required this.name,
      required this.image,
      required this.price,
      required this.category,
      required this.productID,
      this.counter});

  factory DrinkDto.fromJson(Map<String, dynamic> json) {
    return DrinkDto(
      name: json['name'],
      image: json['imageUrl'],
      price: json['prices'][0]['value'],
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
        price: map["price"],
        category: map["category"],
        productID: map["product_id"],
        counter: map['counter']);
  }

  Map<String, dynamic> toMap() {
    return {
      "category": category,
      "name": name,
      "image": image,
      "price": price,
      "product_id": productID,
      "counter": counter ?? 0,
      "category_id": categoryID
    };
  }

  @override
  String toString() {
    return 'DrinkDto { '
        'categoryID: $categoryID, '
        'category: $category, '
        'name: $name, '
        'image: $image, '
        'price: $price, '
        'productID: $productID, '
        'counter: $counter '
        '}';
  }
}
