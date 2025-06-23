import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:store/core/utils/constants/const.dart';

class BannersIndicatorWidget extends StatelessWidget {
  const BannersIndicatorWidget({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: pageController,
      count: 3,
      axisDirection: Axis.horizontal,
      effect: SlideEffect(
        spacing: 15,
        radius: 30,
        dotWidth: 10,
        dotHeight: 10,
        paintStyle: PaintingStyle.stroke,
        strokeWidth: 1.5,
        dotColor: Colors.black,
        activeDotColor: kPrimaryColor,
      ),
    );
  }
}
