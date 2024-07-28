import 'package:flutter/material.dart';
import 'package:mts/core/utils/navigation.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    super.key,
    required this.title,
    this.icon,
    this.to,
  });

  final String title;
  final IconData? icon;
  final Widget? to;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: .2.h),
      child: ListTile(
        onTap: () {
          NavigationHelper.navigateTo(context, to!);
        },
        leading: Icon(
          icon,
          color: Colors.black,
          size: 25.0,
        ),
        title: Text(
          title,
          style: const TextStyle(fontSize: 15.0),
        ),
      ),
    );
  }
}
