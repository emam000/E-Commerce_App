class BannerModel {
  final String image;

  BannerModel({
    required this.image,
  });

  factory BannerModel.fromJson(json) {
    return BannerModel(
      image: json["image"],
    );
  }
}
