import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:houta_vendor/constants/constants.dart';

class BackGroundContainer extends StatelessWidget {
  const BackGroundContainer({super.key, required this.child, this.color});
  final Widget child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
       borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.r), 
                topLeft: Radius.circular(20.r)),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color:color??kLightWhite,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.r), 
                topLeft: Radius.circular(20.r)),
                image:const DecorationImage(image: AssetImage('assets/images/ocean_wave.png'), fit: BoxFit.cover)),
                child:child,
      ),
    );
  }
}
