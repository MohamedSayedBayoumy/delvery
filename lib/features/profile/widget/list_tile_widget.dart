import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    super.key,
    required this.title,
    this.icon,
  });

  final String title;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: .2.h),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.black,
        ),
        title: Text(
          title,
        ),
      ),
    );
  }
}
