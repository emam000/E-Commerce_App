import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:store/core/utils/sizeconfig/size_config.dart';
import 'package:store/features/cart/model/cart_model.dart';

class ProductImageInMyOrdersWidget extends StatelessWidget {
  const ProductImageInMyOrdersWidget({
    super.key,
    required this.product,
  });
  final CartModel product;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(ScreenSize.width / 25),
      child: CachedNetworkImage(
        imageUrl: product.productModel.image,
        height: ScreenSize.height / 7.5,
        width: ScreenSize.width / 3.5,
        placeholder: (context, url) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade200,
            highlightColor: Colors.white,
            child: Container(
              height: ScreenSize.height / 7.5,
              width: ScreenSize.width / 3.5,
              color: Colors.grey,
            ),
          );
        },
        errorWidget: (context, url, error) => Icon(Icons.error),
        fit: BoxFit.fill,
      ),
    );
  }
}
