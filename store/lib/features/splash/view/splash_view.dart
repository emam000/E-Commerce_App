import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:store/core/functions/functions.dart';
import 'package:store/core/utils/constants/const.dart';
import 'package:store/core/utils/sizeconfig/size_config.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return AnimatedSplashScreen(
      backgroundColor: Colors.black,
      splash: splashImage,
      splashIconSize: 300, // ScreenSize.width / 2,
      nextScreen: checkOnboardingAndAuth(),
      splashTransition: SplashTransition.fadeTransition,
      duration: 3000,
    );
  }
}
