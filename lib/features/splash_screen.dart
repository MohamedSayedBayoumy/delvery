import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:mts/features/bottom_navigation/bottom_navigation_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../core/services/local_storage/local_storage.dart';
import '../core/utils/navigation.dart';
import 'auth/login/login_screen.dart';
import 'auth/register/upload_document.dart';

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

  routing(_, context) async {
    final checkUserCompeleteData = await SecureLocalStorage.get(
      SecureLocalStorage.userRegistrationKey,
    );
    final token = await SecureLocalStorage.get(
      SecureLocalStorage.userTokenKey,
    );
    if (checkUserCompeleteData == "false") {
      NavigationHelper.navigateRemoveUntilTo(
        context,
        const UploadDocumentScreen(),
      );
    } else if (token == "empty") {
      NavigationHelper.navigateRemoveUntilTo(context, const LoginScreen());
    } else {
      NavigationHelper.navigateRemoveUntilTo(
        context,
        const BottomNavigationBarScreens(),
      );
    }
  }
}
