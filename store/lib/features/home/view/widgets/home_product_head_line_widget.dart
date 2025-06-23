import 'package:flutter/material.dart';
import 'package:store/core/utils/sizeconfig/size_config.dart';

class HomeProductsHeadLineWidget extends StatelessWidget {
  const HomeProductsHeadLineWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Products",
          style: TextStyle(
              fontSize: ScreenSize.width / 20,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        )
      ],
    );
  }
}
