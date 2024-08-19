import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:houta_vendor/common/app_style.dart';
import 'package:houta_vendor/common/background_container.dart';
import 'package:houta_vendor/common/custom_button.dart';
import 'package:houta_vendor/common/reusable_text.dart';
import 'package:houta_vendor/constants/constants.dart';
import 'package:houta_vendor/views/auth/login_page.dart';
import 'package:lottie/lottie.dart';

class LoginRedirectPage extends StatelessWidget {
  const LoginRedirectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimary,
        title: Center(
          child: ReusableText(text: "please login to access this page",style: appStyle(13, kLightWhite, FontWeight.normal),),
        ),
      ),
      body: BackGroundContainer(
        color:Colors.white,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
          child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 10.h,
            ),
            Lottie.asset("assets/anime/small_animated_fish.json"),
              CustomButton(onTap: () {
                Get.to(()=>const LoginPage(),
                transition: Transition.cupertino,
                duration: const Duration(milliseconds: 900));
              },
              btnColor: kPrimary,
              text: "L O G I N",
              btnHeight: 40.h,
              btnWidth: width-20,)
          ],
                ),
        ),),
    );
  }
}