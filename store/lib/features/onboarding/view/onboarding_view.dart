import 'package:flutter/material.dart';
import 'package:store/core/utils/constants/const.dart';
import 'package:store/core/utils/sizeconfig/size_config.dart';
import 'package:store/features/onboarding/view/widgets/Onboarding_Indicator_widget.dart';
import 'package:store/features/onboarding/view/widgets/onboarding_next_button_widget.dart';
import 'package:store/features/onboarding/view/widgets/onboarding_widget.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  int index = 0;
  PageController controller = PageController();
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackcolor,
      body: Stack(
        alignment: Alignment.center,
        children: [
          PageView(
            controller: controller,
            onPageChanged: (val) {
              index = val;
              setState(() {});
            },
            children: [
              OnboardingWidget(
                title: onboardingTitleOne,
                body: onboardingBodyOne,
                image: onboardingImageOne,
              ),
              OnboardingWidget(
                title: onboardingTitleTwo,
                body: onboardingBodyTwo,
                image: onboardingImageTwo,
              ),
              OnboardingWidget(
                title: onboardingTitleThree,
                body: onboardingBodyThree,
                image: onboardingImageThree,
              ),
            ],
          ),
          Positioned(
            bottom: ScreenSize.height / 5,
            child: OnboardingIndicatorWidget(controller: controller),
          ),
          Positioned(
            bottom: ScreenSize.height / 15,
            child: OnboardingNextButtonWidget(
                index: index, controller: controller),
          ),
        ],
      ),
    );
  }
}
