import 'package:flutter/material.dart';
import 'package:store/core/functions/functions.dart';
import 'package:store/core/utils/constants/const.dart';
import 'package:store/core/utils/sizeconfig/size_config.dart';

class SigninWithGoogleButtonWidget extends StatelessWidget {
  const SigninWithGoogleButtonWidget({super.key, this.onPress});
  final void Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPress,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ScreenSize.width / 20),
      ),
      height: ScreenSize.height / 15,
      color: Colors.black,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            googleLogo,
            width: ScreenSize.width / 10,
            height: ScreenSize.height / 20,
          ),
          spaceHorizontal(width: ScreenSize.width / 20),
          Text(
            "Continue with Google",
            style: TextStyle(
              color: Colors.white,
              fontSize: ScreenSize.width / 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
