class ProductModel {
  final String categoryId;
  final String productId;
  final String name;
  final String image;
  final num price;
  final num oldPrice;
  final String description;

  ProductModel({
    required this.categoryId,
    required this.productId,
    required this.name,
    required this.image,
    required this.price,
    required this.oldPrice,
    required this.description,
  });

  factory ProductModel.fromJson(json) {
    return ProductModel(
      categoryId: json["category_id"],
      productId: json["product_id"],
      name: json["name"],
      image: json["image"],
      price: json["price"],
      oldPrice: json["old_price"],
      description: json["description"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "category_id": categoryId,
      "product_id": productId,
      "name": name,
      "image": image,
      "price": price,
      "old_price": oldPrice,
      "description": description,
    };
  }
}
