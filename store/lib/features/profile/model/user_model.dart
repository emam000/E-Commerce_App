class UserModel {
  final String uid;
  final String name;
  final String email;
  final String phone;
  final double lat;
  final double long;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.phone,
    required this.lat,
    required this.long,
  });

  factory UserModel.fromJson(json) {
    return UserModel(
      uid: json["uid"],
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
      lat: json["lat"],
      long: json["long"],
    );
  }
  toMap() {
    return {
      "uid": uid,
      "name": name,
      "email": email,
      "phone": phone,
      "lat": lat,
      "long": long,
    };
  }
}
