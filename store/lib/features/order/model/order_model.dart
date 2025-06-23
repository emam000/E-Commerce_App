import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:store/features/cart/model/cart_model.dart';

class OrderModel {
  final String orderId;
  final String userId;
  final String address;
  final String shippingType;
  final List<CartModel> cartProducts;
  final num subtotal;
  final num discount;
  final num deliveryFees;
  final num total;
  final Timestamp timestamp;
  final String status;
  final String? paymentMethod;

  OrderModel({
    required this.orderId,
    required this.userId,
    required this.address,
    required this.shippingType,
    required this.cartProducts,
    required this.subtotal,
    required this.discount,
    required this.deliveryFees,
    required this.total,
    required this.timestamp,
    required this.status,
    required this.paymentMethod,
  });

  factory OrderModel.fromJson(json) {
    return OrderModel(
      orderId: json["order_id"],
      userId: json["user_id"],
      address: json["address"],
      shippingType: json["shipping_type"],
      cartProducts: (json["cart_products"] as List)
          .map((e) => CartModel.fromJson(e))
          .toList(),
      subtotal: json["subtotal"],
      discount: json["discount"],
      deliveryFees: json["delivery_fees"],
      total: json["total"],
      timestamp: json["timestamp"],
      status: json["status"],
      paymentMethod: json["paymentMethod"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "order_id": orderId,
      "user_id": userId,
      "address": address,
      "shipping_type": shippingType,
      "cart_products": cartProducts.map((e) => e.toMap()).toList(),
      "subtotal": subtotal,
      "discount": discount,
      "delivery_fees": deliveryFees,
      "total": total,
      "timestamp": timestamp,
      "status": status,
      "paymentMethod": paymentMethod,
    };
  }
}
