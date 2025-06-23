import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:store/core/utils/sizeconfig/size_config.dart';
import 'package:store/features/products/model/product_model.dart';

class ProductImageInCartWidget extends StatelessWidget {
  const ProductImageInCartWidget({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(ScreenSize.width / 25),
      child: CachedNetworkImage(
        imageUrl: product.image,
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
