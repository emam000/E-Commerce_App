import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:store/core/database/cache/cache_helper.dart';
import 'package:store/core/utils/constants/const.dart';
import 'package:store/core/utils/sizeconfig/size_config.dart';
import 'package:store/features/authentication/view/signin_view.dart';

class OnboardingNextButtonWidget extends StatelessWidget {
  const OnboardingNextButtonWidget({
    super.key,
    required this.index,
    required this.controller,
  });

  final int index;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () async {
        if (index == 2) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => SigninView()));
          await CacheHelper.saveData(key: "isVisited", value: true);
          log("isVisited == true");
        } else {
          controller.nextPage(
            duration: Duration(milliseconds: 500),
            curve: Curves.bounceInOut,
          );
        }
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: kPrimaryColor,
      minWidth: ScreenSize.width / 2,
      height: ScreenSize.height / 18,
      child: Text(
        index == 2 ? "Get Started" : "Next",
        style: TextStyle(
          fontSize: ScreenSize.width / 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
