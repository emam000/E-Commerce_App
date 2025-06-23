import 'package:flutter/material.dart';
import 'package:store/core/utils/constants/const.dart';
import 'package:store/core/utils/sizeconfig/size_config.dart';
import 'package:store/features/authentication/view/signin_view.dart';

class AlreadyHaveAccWidget extends StatelessWidget {
  const AlreadyHaveAccWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account? ",
          style: TextStyle(
            fontSize: ScreenSize.width / 25,
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => SigninView()));
          },
          child: Text(
            "Sign In", // Replace with your desired text
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
