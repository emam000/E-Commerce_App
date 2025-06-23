import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:store/core/utils/constants/const.dart';

class OnboardingIndicatorWidget extends StatelessWidget {
  const OnboardingIndicatorWidget({
    super.key,
    required this.controller,
  });

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: 3,
      axisDirection: Axis.horizontal,
      effect: SlideEffect(
          spacing: 15,
          radius: 30,
          dotWidth: 10,
          dotHeight: 10,
          paintStyle: PaintingStyle.stroke,
          strokeWidth: 1.5,
          dotColor: Colors.grey,
          activeDotColor: kPrimaryColor),
    );
  }
}
