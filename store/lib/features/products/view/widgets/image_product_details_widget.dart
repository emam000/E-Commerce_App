import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:store/core/utils/sizeconfig/size_config.dart';
import 'package:store/features/products/model/product_model.dart';

class ImageProductDetailsWidget extends StatelessWidget {
  const ImageProductDetailsWidget({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CachedNetworkImage(
        imageUrl: productModel.image,
        height: ScreenSize.height / 2.5,
        width: ScreenSize.width / 1.2,
        fit: BoxFit.fill,
        placeholder: (context, url) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade200,
            highlightColor: Colors.white,
            child: Container(
              height: ScreenSize.height / 2.5,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(ScreenSize.width / 25),
              ),
            ),
          );
        },
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}
