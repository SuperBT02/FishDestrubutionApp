import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:houta_vendor/common/app_style.dart';
import 'package:houta_vendor/common/reusable_text.dart';
import 'package:houta_vendor/constants/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, this.onTap, this.btnWidth, this.btnHeight, this.btnColor, this.btnRadius, required this.text});
  final void Function()? onTap;
  final double? btnWidth;
  final double? btnHeight;
  final Color? btnColor;
  final double? btnRadius;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          width: btnWidth ?? width,
          height: btnHeight ?? 28.h,
          decoration: BoxDecoration(
              color: btnColor ?? kPrimary,
              borderRadius: BorderRadius.circular(btnRadius??9.r)),

              child: Center(child: ReusableText(text: text, style: appStyle(12, kLightWhite, FontWeight.w500))),
        ));
  }
}
