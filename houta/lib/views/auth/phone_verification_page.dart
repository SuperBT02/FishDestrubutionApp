import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:houta/common/app_style.dart';
import 'package:houta/constants/constants.dart';
import 'package:houta/controllers/phone_verification_controller.dart';
import 'package:houta/services/verification_service.dart';
import 'package:phone_otp_verification/phone_verification.dart';

class PhoneVerificationPage extends StatefulWidget {
  const PhoneVerificationPage({super.key});

  @override
  State<PhoneVerificationPage> createState() => _PhoneVerificationPageState();
}

class _PhoneVerificationPageState extends State<PhoneVerificationPage> {
  final VerificationService _verificationService = VerificationService();
  String _verificationId ='';
  late final PhoneVerificationController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(PhoneVerificationController());
  }

  @override
  Widget build(BuildContext context) {
    return Obx(()=>controller.isLoading == false?PhoneVerification(
      isFirstPage: false,
      enableLogo: false,
      themeColor: kPrimary,
      backgroundColor: kLightWhite,
      initialPageText: "Verify Phone Number",
      initialPageTextStyle: appStyle(20, kPrimary, FontWeight.bold),
      textColor: kDark,
      onSend: (String value) {
        print(value);
        controller.setPhoneNumber=value;
        _verifyPhoneNumber(value);
      },
      onVerification: (String value) {
        _submitVerificationCode(value);
      },
    ):Container(
      color: kLightWhite,
      width: width,
      height: height,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    ));
  }

  void _verifyPhoneNumber(String phoneNumber)async{
    await _verificationService.verifyPhoneNumber(phoneNumber, codeSent:(String verificationId , int? resendToken){
      setState(() {
        _verificationId = verificationId;
      });
    });
  }

  void _submitVerificationCode(String code)async{
    await _verificationService.verifySmsCode(_verificationId, code);
  }
}