import 'package:flutter/material.dart';
import 'package:store/core/utils/constants/const.dart';

class CustomButtonCheckoutFeatureWidget extends StatelessWidget {
  const CustomButtonCheckoutFeatureWidget({
    super.key,
    required this.onPressed,
    required this.title,
  });

  final void Function()? onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: kPrimaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      minWidth: double.infinity,
      height: 50,
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
