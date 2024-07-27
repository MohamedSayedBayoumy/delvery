// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constants/colors.dart';
import '../constants/fonts.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Widget? suffixWidget;
  final Widget? prefixWidget;
  final double? height;
  final double? width;
  final dynamic fontSize;

  final dynamic cursorHeight;
  final dynamic showCursor;
  final int? length;
  final int? maxLines;
  final int? minLines;
  final String? labelText;
  final String? hinText;
  final TextStyle? hinStyle;
  final bool? fill;
  final Color? fillColor;
  final Color? borderColor;
  final Color? enabledBorderColor;
  final Color? colorSuffixIcon;
  final dynamic enabledBorderCurve;
  final Color? labelColor;
  final InputBorder? styleBorder;
  final String? Function(String?)? valid;
  final String? Function(String?)? onChange;

  final void Function()? onTap;
  final bool? enabled;
  final TextInputType? keyboardType;
  final dynamic curveBorder;
  final bool? obscureText;
  final Color? textColor;
  final TextAlign textAlign;
  void Function()? onPressedSuffixIcon;
  FocusNode? focusNode;
  List<TextInputFormatter>? inputFormatters;

  final void Function(String)? onFieldSubmitted;

  final Color? cursorColor;

  bool? autoCloseKeyboard = true;

  CustomTextField({
    super.key,
    required this.controller,
    this.hinStyle,
    this.autoCloseKeyboard,
    this.textColor,
    this.focusNode,
    this.prefixWidget,
    this.prefixIcon,
    this.colorSuffixIcon,
    this.suffixIcon,
    this.fontSize,
    this.onPressedSuffixIcon,
    this.enabledBorderCurve,
    this.keyboardType,
    this.curveBorder,
    this.labelColor,
    this.onChange,
    this.onTap,
    this.maxLines,
    this.inputFormatters,
    this.hinText,
    this.minLines,
    this.fill,
    this.fillColor,
    this.cursorHeight,
    this.valid,
    this.labelText,
    this.showCursor,
    this.enabled,
    this.length,
    this.height,
    this.styleBorder,
    this.enabledBorderColor,
    this.width,
    this.obscureText,
    this.borderColor,
    this.suffixWidget,
    this.onFieldSubmitted,
    this.textAlign = TextAlign.start,
    this.cursorColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      onTapOutside: autoCloseKeyboard == false
          ? (event) {}
          : (event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
      style: ConstantsFonts.textFiledFont,
      obscureText: obscureText == null || obscureText == false ? false : true,
      obscuringCharacter: "⬮",
      keyboardType: keyboardType,
      textAlign: textAlign,
      onChanged: onChange,
      onTap: onTap,
      enabled: enabled,
      validator: valid,
      controller: controller,
      minLines: minLines,
      maxLines: maxLines,
      maxLength: length,
      showCursor: showCursor,
      cursorColor: cursorColor ?? ConstantsColor.greenColor,
      onFieldSubmitted: onFieldSubmitted,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        prefixIconColor: WidgetStateColor.resolveWith(
          (states) => states.contains(WidgetState.focused)
              ? ConstantsColor.greenColor
              : Colors.black,
        ),
        contentPadding: EdgeInsetsDirectional.only(bottom: 4.h, start: 15),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        isDense: true,
        suffixIcon: suffixWidget,
        filled: true,
        fillColor: ConstantsColor.fillTextFiled,
        labelText: labelText ?? "",
        hintText: hinText,
        labelStyle: ConstantsFonts.labelTextFiledFont,
        hintStyle: ConstantsFonts.labelTextFiledFont,
        prefixIcon:
            prefixWidget ?? (prefixIcon == null ? null : Icon(prefixIcon)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColor ?? ConstantsColor.fillTextFiled,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(curveBorder ?? 12.0),
        ),
        enabledBorder: styleBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: borderColor ?? ConstantsColor.fillTextFiled,
                width: 6.0,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColor ?? ConstantsColor.fillTextFiled,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
