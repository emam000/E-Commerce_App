class CategoryModel {
  final String categoryId;
  final String name;
  final String image;

  CategoryModel({
    required this.categoryId,
    required this.name,
    required this.image,
  });
  factory CategoryModel.fromJson(json) {
    return CategoryModel(
      categoryId: json["category_id"],
      name: json["name"],
      image: json["image"],
    );
  }
}
