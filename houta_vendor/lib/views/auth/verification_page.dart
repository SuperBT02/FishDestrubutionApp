import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:houta_vendor/common/app_style.dart';
import 'package:houta_vendor/common/custom_button.dart';
import 'package:houta_vendor/common/custom_container.dart';
import 'package:houta_vendor/common/reusable_text.dart';
import 'package:houta_vendor/constants/constants.dart';
import 'package:houta_vendor/controllers/verification_controller.dart';
import 'package:lottie/lottie.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerificationController());
    return Scaffold(
        backgroundColor: kPrimary,
        appBar: AppBar(
          title: ReusableText(
              text: 'Please Verify Your Account',
              style: appStyle(12, kGray, FontWeight.w600)),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: CustomContainer(
            color: Colors.white,
            ContainerContent: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
                height: height,
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    Lottie.asset("assets/anime/small_animated_fish.json",
                        height: 150.h, width: width),
                    SizedBox(
                      height: 30.h,
                    ),
                    Center(
                        child: ReusableText(
                            text: "Please Verify Your Account",
                            style: appStyle(20, kPrimary, FontWeight.w600))),
                    SizedBox(
                      height: 10.h,
                    ),
                    Center(
                        child: ReusableText(
                            text: "Enter the 6-digit code sent to your email",
                            style: appStyle(10, kGray, FontWeight.normal))),
                    SizedBox(
                      height: 20.h,
                    ),
                    OtpTextField(
                      numberOfFields: 6,
                      borderColor: kPrimary,
                      textStyle: appStyle(17, kDark, FontWeight.w500),
                      borderWidth: 2.0,
                      onCodeChanged: (String code) {},
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      onSubmit: (String verificationCode) {
                        controller.setCode=verificationCode;
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomButton(
                      onTap: () {
                        controller.verificationFunction();

                      },
                      btnColor: kPrimary,
                      text: "V E R I F Y ",
                      btnHeight: 35.h,
                      btnWidth: width,
                    ),
                  ],
                ),
              ),
            )));
  }
}
