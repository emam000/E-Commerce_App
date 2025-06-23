import 'package:flutter/material.dart';
import 'package:store/core/functions/functions.dart';
import 'package:store/core/utils/sizeconfig/size_config.dart';
import 'package:store/features/products/model/product_model.dart';

class NameAndPriceProductInCartWidget extends StatelessWidget {
  const NameAndPriceProductInCartWidget({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: ScreenSize.width / 2.5,
          child: Text(
            product.name,
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
          "${product.price} EGP",
          style: TextStyle(
            fontSize: ScreenSize.width / 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "${product.oldPrice} EGP",
          style: TextStyle(
            color: Colors.red,
            fontSize: ScreenSize.width / 30,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.lineThrough,
          ),
        ),
      ],
    );
  }
}
