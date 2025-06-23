import 'package:flutter/material.dart';
import 'package:store/core/utils/constants/const.dart';
import 'package:store/core/utils/sizeconfig/size_config.dart';

class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton({super.key, this.onPress, required this.text});
  final void Function()? onPress;
  final String text;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPress,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: kPrimaryColor,
      minWidth: ScreenSize.width / 2,
      height: ScreenSize.height / 18,
      child: Text(
        text,
        style: TextStyle(
          fontSize: ScreenSize.width / 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
