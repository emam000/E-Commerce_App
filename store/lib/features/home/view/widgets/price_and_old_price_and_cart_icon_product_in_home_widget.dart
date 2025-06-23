import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/functions/functions.dart';
import 'package:store/core/utils/constants/const.dart';
import 'package:store/core/utils/sizeconfig/size_config.dart';
import 'package:store/features/cart/view_model/cubit/cart_cubit.dart';
import 'package:store/features/products/model/product_model.dart';

class PriceAndOldPriceAndCartIconProductInHomeWidget extends StatelessWidget {
  const PriceAndOldPriceAndCartIconProductInHomeWidget({
    super.key,
    required this.product,
    required this.cartCubit,
  });

  final ProductModel product;
  final CartCubit cartCubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Text(
                "${product.price} EGP",
                style: TextStyle(
                  fontSize: ScreenSize.width / 33,
                  fontWeight: FontWeight.bold,
                ),
              ),
              spaceHorizontal(width: ScreenSize.width / 60),
              Text(
                "${product.oldPrice} EGP",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: ScreenSize.width / 33,
                  // fontWeight: FontWeight.bold,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            cartCubit.addorRemoveProductsFromCart(product);
          },
          child: BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              return Icon(
                Icons.shopping_cart,
                size: ScreenSize.height / 35,
                color: cartCubit.cartID.contains(product.productId)
                    ? kPrimaryColor
                    : Colors.grey,
              );
            },
          ),
        ),
      ],
    );
  }
}
