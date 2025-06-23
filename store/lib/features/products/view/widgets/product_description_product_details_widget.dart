import 'package:flutter/material.dart';
import 'package:store/core/utils/sizeconfig/size_config.dart';
import 'package:store/features/products/model/product_model.dart';

class ProductDescriptionProductDetailsWidget extends StatelessWidget {
  const ProductDescriptionProductDetailsWidget({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.justify,
      productModel.description,
      style: TextStyle(
        color: Colors.grey.shade600,
        fontSize: ScreenSize.width / 22,
      ),
    );
  }
}
