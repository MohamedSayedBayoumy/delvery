import 'package:flutter/material.dart';
import 'package:mts/features/profile/profile_screen.dart';

import '../../core/constants/colors.dart';
import '../notification/notification_screen.dart';
import '../orders/orders_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BottomNavigationBarScreens extends StatefulWidget {
  const BottomNavigationBarScreens({super.key});

  @override
  State<BottomNavigationBarScreens> createState() =>
      _BottomNavigationBarScreensState();
}

class _BottomNavigationBarScreensState
    extends State<BottomNavigationBarScreens> {
  PageController pageController = PageController();

  int selectedIndex = 0;
  final padding = const EdgeInsets.symmetric(horizontal: 15, vertical: 12);

  void _onItemTapped(int index) {
    pageController.jumpToPage(index);
    selectedIndex = index;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        children: const [OrdersScreen(), NotificationScreen(), ProfileScreen()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
        elevation: 0.0,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        selectedItemColor: ConstantsColor.greenColor,
        unselectedItemColor: const Color(0xff64748b),
        selectedLabelStyle: const TextStyle(color: ConstantsColor.greenColor),
        unselectedLabelStyle: const TextStyle(color: Colors.black54),
        items: [
          BottomNavigationBarItem(
            icon: iconWidget(Icons.food_bank_rounded),
            // activeIcon: iconWidget(ConstantsImages.activeHome),
            label: "Orders",
          ),
          BottomNavigationBarItem(
            icon: iconWidget(Icons.notifications_none_outlined),
            label: AppLocalizations.of(context)!.notification,
          ),
          BottomNavigationBarItem(
            icon: iconWidget(Icons.person),
            label: "profile",
          ),
        ],
      ),
    );
  }

  Padding iconWidget(image) => Padding(
        padding: const EdgeInsets.only(bottom: 2),
        child: Icon(image),
        // child: ImageIcon(AssetImage(image)),
      );
}
