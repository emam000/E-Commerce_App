import 'package:flutter/material.dart';
import 'package:store/core/utils/constants/const.dart';
import 'package:store/core/utils/sizeconfig/size_config.dart';
import 'package:store/features/cart/model/cart_model.dart';
import 'package:store/features/order/model/order_model.dart';
import 'package:store/features/order/view/widgets/name_and_price_product_in_my_orders_widget.dart';
import 'package:store/features/order/view/widgets/product_image_in_My_Orders_widget.dart';

class ProductInMyOrdersWidget extends StatelessWidget {
  const ProductInMyOrdersWidget({
    super.key,
    required this.product,
    required this.order,
  });
  final CartModel product;
  final OrderModel order;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(ScreenSize.width / 120),
      margin: EdgeInsets.all(ScreenSize.width / 120),
      height: ScreenSize.height / 5.5,
      decoration: BoxDecoration(
        color: kbackcolor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: kPrimaryColor, width: 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ProductImageInMyOrdersWidget(
            product: product,
          ),
          NameAndPriceProductInMyOrdersWidget(
            product: product,
            order: order,
          ),
        ],
      ),
    );
  }
}
