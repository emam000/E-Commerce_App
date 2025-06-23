import 'package:flutter/material.dart';
import 'package:store/core/utils/sizeconfig/size_config.dart';

class CustomTitleCheckoutFeatureWidget extends StatelessWidget {
  const CustomTitleCheckoutFeatureWidget({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: TextStyle(
            fontSize: ScreenSize.width / 20, fontWeight: FontWeight.bold));
  }
}
