import 'package:flutter/material.dart';
import 'package:store/core/functions/functions.dart';
import 'package:store/core/utils/sizeconfig/size_config.dart';
import 'package:store/features/cart/model/cart_model.dart';
import 'package:store/features/order/model/order_model.dart';

class NameAndPriceProductInMyOrdersWidget extends StatelessWidget {
  const NameAndPriceProductInMyOrdersWidget({
    super.key,
    required this.product,
    required this.order,
  });
  final CartModel product;
  final OrderModel order;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: ScreenSize.width / 2.5,
          child: Text(
            product.productModel.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: ScreenSize.width / 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        spaceVertical(height: ScreenSize.height / 150),
        Text(
          "Qty ${product.quantity}",
          style: TextStyle(
            fontSize: ScreenSize.width / 33,
            fontWeight: FontWeight.bold,
          ),
        ),
        spaceVertical(height: ScreenSize.height / 150),
        Text(
          "${product.productModel.price} EGP",
          style: TextStyle(
            fontSize: ScreenSize.width / 33,
            fontWeight: FontWeight.bold,
          ),
        ),
        spaceVertical(height: ScreenSize.height / 150),
        Text(
          "PaymentStatus : ${order.status}",
          style: TextStyle(
              fontSize: ScreenSize.width / 33,
              fontWeight: FontWeight.bold,
              color: Colors.grey),
        ),
        spaceVertical(height: ScreenSize.height / 150),
        Text(
          order.paymentMethod.toString(),
          style: TextStyle(
              fontSize: ScreenSize.width / 33,
              fontWeight: FontWeight.bold,
              color: Colors.grey),
        ),
      ],
    );
  }
}
