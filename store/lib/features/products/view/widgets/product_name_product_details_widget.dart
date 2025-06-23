import 'package:flutter/material.dart';
import 'package:store/core/utils/sizeconfig/size_config.dart';
import 'package:store/features/products/model/product_model.dart';

class ProductNameProductDetailsWidget extends StatelessWidget {
  const ProductNameProductDetailsWidget({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Text(
      productModel.name,
      style: TextStyle(
        fontSize: ScreenSize.width / 15,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
