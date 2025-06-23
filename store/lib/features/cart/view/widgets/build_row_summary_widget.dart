import 'package:flutter/material.dart';
import 'package:store/core/utils/sizeconfig/size_config.dart';

class BuildRowSummaryWidget extends StatelessWidget {
  const BuildRowSummaryWidget({
    super.key,
    required this.title,
    required this.value,
  });
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.grey,
            fontSize: ScreenSize.width / 20,
          ),
        ),
        Text(
          value,
          style: TextStyle(
              fontSize: ScreenSize.width / 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
