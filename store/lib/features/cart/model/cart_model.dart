import 'package:store/features/products/model/product_model.dart';

class CartModel {
  final ProductModel productModel;
  final int quantity;

  CartModel({required this.productModel, required this.quantity});

  factory CartModel.fromJson(json) {
    return CartModel(
      productModel: ProductModel.fromJson(json["productModel"]),
      quantity: json["quantity"] ?? 1,
    );
  }
  toMap() {
    return {
      "productModel": productModel.toMap(),
      "quantity": quantity,
    };
  }
}
// import 'package:store/features/products/model/product_model.dart';

// class CartModel extends ProductModel {
//   final int quantity;
//   CartModel({
//     required this.quantity,
//     required super.categoryId,
//     required super.productId,
//     required super.name,
//     required super.image,
//     required super.price,
//     required super.oldPrice,
//     required super.description,
//   });
//   factory CartModel.fromJson(json) {
//     return CartModel(
//       quantity: json["quantity"] ?? 2,
//       categoryId: json["category_id"],
//       productId: json["product_id"],
//       name: json["name"],
//       image: json["image"],
//       price: json["price"],
//       oldPrice: json["old_price"],
//       description: json["description"],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       "quantity": quantity,
//       "category_id": categoryId,
//       "product_id": productId,
//       "name": name,
//       "image": image,
//       "price": price,
//       "old_price": oldPrice,
//       "description": description,
//     };
//   }
// }
