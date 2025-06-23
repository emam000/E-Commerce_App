import 'package:flutter/material.dart';
import 'package:store/core/utils/constants/const.dart';
import 'package:store/core/utils/sizeconfig/size_config.dart';
import 'package:store/features/authentication/view/signup_view.dart';

class DonotHaveAccWidget extends StatelessWidget {
  const DonotHaveAccWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: TextStyle(
            fontSize: ScreenSize.width / 25,
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => SignupView()));
          },
          child: Text(
            "Sign Up", // Replace with your desired text
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: ScreenSize.width / 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
