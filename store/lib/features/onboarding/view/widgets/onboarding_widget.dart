import 'package:flutter/material.dart';
import 'package:store/core/utils/sizeconfig/size_config.dart';

class OnboardingWidget extends StatelessWidget {
  final String title;
  final String body;
  final String image;
  const OnboardingWidget(
      {super.key,
      required this.title,
      required this.body,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          image,
          height: ScreenSize.height / 3,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: ScreenSize.width / 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: ScreenSize.height / 50,
        ),
        Text(
          body,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: ScreenSize.width / 25,
            color: Colors.grey.shade500,
          ),
        ),
      ],
    );
  }
}
