import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:houta_vendor/common/app_style.dart';
import 'package:houta_vendor/common/reusable_text.dart';
import 'package:houta_vendor/constants/constants.dart';
import 'package:houta_vendor/views/profile/profile_page.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 100.h,
      padding: EdgeInsets.fromLTRB(12.w, 44.h, 12.w, 0.w),
      color: kPrimary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(const ProfilePage());
                },
                child: CircleAvatar(
                  radius: 25.r,
                  backgroundColor: Colors.white,
                  backgroundImage: const AssetImage("assets/images/profile.jpg"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableText(
                      text:"Kings Fishs",
                      style: appStyle(14.sp,Colors.white,FontWeight.bold)
                    ),
                    ReusableText(
                      text:"Zarzis Mednine Tunsie",
                      style: appStyle(12, Colors.white, FontWeight.normal)
                    ),
                  ],
                ),
              ),
            ],
          ),
          SvgPicture.asset(
            'assets/icons/open_sign.svg',
            height: 40.h,
            width: 40.w,
          ),
        ],
      ),
    );
  }
}
