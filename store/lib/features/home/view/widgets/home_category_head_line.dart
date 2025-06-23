import 'package:flutter/material.dart';
import 'package:store/core/utils/sizeconfig/size_config.dart';

class HomeCategoryHeadLineWidget extends StatelessWidget {
  const HomeCategoryHeadLineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Categories",
          style: TextStyle(
              fontSize: ScreenSize.width / 20,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
      ],
    );
  }
}
