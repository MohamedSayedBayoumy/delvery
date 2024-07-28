import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constants/colors.dart';
import '../constants/fonts.dart';
import '../utils/enums.dart';

class CustomButton extends StatelessWidget {
  final String? buttonText;
  final Color? buttonColor;
  final Color? borderColor;
  final IconType? typeIcon;
  final Icon? icon;
  final String? image;
  final void Function()? onPressed;
  final double? width;
  final double? height;
  final double? fontSize;
  final double? raduis;
  final bool? handleTextColor;
  final Color? fontColor;

  const CustomButton({
    super.key,
    this.buttonText,
    this.fontSize,
    this.typeIcon,
    this.image,
    this.width,
    this.height,
    this.buttonColor,
    this.icon,
    this.onPressed,
    this.borderColor,
    this.handleTextColor = true,
    this.fontColor,
    this.raduis,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? MediaQuery.sizeOf(context).width,
      height: height ?? 5.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          overlayColor: const WidgetStatePropertyAll(Colors.white),
          foregroundColor: const WidgetStatePropertyAll(Colors.transparent),
          elevation: const WidgetStatePropertyAll(0.0),
          backgroundColor: WidgetStatePropertyAll(
            buttonColor ?? ConstantsColor.greenColor,
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(raduis ?? 13.0),
              side: BorderSide(
                color: borderColor ?? ConstantsColor.greenColor,
              ),
            ),
          ),
        ),
        child: typeIcon != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (typeIcon == IconType.assets) ...[
                    Image.asset(
                      image!,
                      width: 5.w,
                    )
                  ] else ...[
                    icon!,
                  ],
                  const SizedBox(width: 8.0),
                  Text(
                    "$buttonText",
                    style: fontColor != null
                        ? ConstantsFonts.buttonStyle.copyWith(color: fontColor)
                        : ConstantsFonts.buttonStyle,
                  ),
                ],
              )
            : Text(
                "$buttonText",
                style: fontColor != null
                    ? ConstantsFonts.buttonStyle.copyWith(color: fontColor)
                    : ConstantsFonts.buttonStyle,
              ),
      ),
    );
  }
}
