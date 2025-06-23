import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:store/core/utils/sizeconfig/size_config.dart';
import 'package:store/features/products/model/product_model.dart';

class ImageProductInHomeWidget extends StatelessWidget {
  const ImageProductInHomeWidget({
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
        height: ScreenSize.height / 5.1,
        width: ScreenSize.height / 5,
        placeholder: (context, url) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade200,
            highlightColor: Colors.white,
            child: Container(
              height: ScreenSize.height / 5.1,
              width: ScreenSize.height / 5,
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
