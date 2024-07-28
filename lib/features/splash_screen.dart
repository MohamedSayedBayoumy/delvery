import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../core/utils/navigation.dart';
import 'auth/login/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeIn(
          delay: const Duration(milliseconds: 500),
          duration: const Duration(milliseconds: 800),
          onFinish: (_) {
            routing(_, context);
          },
          child: Image.asset("assets/LOGO SAFRI.jpg", width: 30.w),
        ),
      ),
    );
  }

  routing(_, context) {
    NavigationHelper.navigateRemoveUntilTo(context, const LoginScreen());

    // if (InitialValues.onBoardingView == "1") {
    //   // user is already viewed on boarding .. .
    //   NavigationHelper.navigateRemoveUntilTo(context, const PreLoginScreen());
    // } else if (DioServices.userToken != "") {
    //   NavigationHelper.navigateRemoveUntilTo(context, const HomeScreen());
    // } else {
    //   NavigationHelper.navigateRemoveUntilTo(context, const OnBoardingScreen());
    // }
  }
}
