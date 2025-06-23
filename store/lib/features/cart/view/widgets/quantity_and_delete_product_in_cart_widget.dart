import 'package:flutter/material.dart';
import 'package:store/core/functions/functions.dart';
import 'package:store/core/utils/sizeconfig/size_config.dart';
import 'package:store/features/cart/model/cart_model.dart';
import 'package:store/features/cart/view/widgets/delete_in_cart_widget.dart';
import 'package:store/features/cart/view/widgets/quantity_in_cart_widget.dart';
import 'package:store/features/cart/view_model/cubit/cart_cubit.dart';
import 'package:store/features/products/model/product_model.dart';

class QuantityAndDeleteProductInCartWidget extends StatelessWidget {
  const QuantityAndDeleteProductInCartWidget({
    super.key,
    required this.cartCubit,
    required this.product,
    required this.cartModel,
  });

  final CartCubit cartCubit;
  final ProductModel product;
  final CartModel cartModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        QuantityInCartWidget(
          cartModel: cartModel,
        ),
        spaceVertical(height: ScreenSize.height / 50),
        DeleteInCartWidget(
          cartCubit: cartCubit,
          product: product,
        ),
        spaceVertical(height: ScreenSize.height / 100),
      ],
    );
  }
}
