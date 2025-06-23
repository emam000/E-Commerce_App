import 'package:flutter/material.dart';
import 'package:store/core/utils/constants/const.dart';
import 'package:store/core/utils/sizeconfig/size_config.dart';

class ProceedToCheckoutButtonWidget extends StatelessWidget {
  const ProceedToCheckoutButtonWidget({
    super.key,
    this.onPressed,
    required this.title,
  });
  final void Function()? onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      minWidth: ScreenSize.width / 1.5,
      height: ScreenSize.height / 20,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ScreenSize.width / 20)),
      color: kPrimaryColor,
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: ScreenSize.width / 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
