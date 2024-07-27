import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';
import '../../core/utils/navigation.dart';
import '../register/set_location.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Moahamed"),
            InkWell(
              onTap: () {
                NavigationHelper.navigateTo(
                  context,
                  const SelectLocationScreen(),
                );
              },
              child: const Row(
                children: [
                  Text("Egypt"),
                  Icon(Icons.arrow_drop_down_sharp),
                ],
              ),
            )
          ],
        ),
        actions: [
          Switch(
            // This bool value toggles the switch.
            value: true,
            activeColor: ConstantsColor.greenColor,
            onChanged: (bool value) {},
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
