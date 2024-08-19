import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:houta_vendor/common/app_style.dart';
import 'package:houta_vendor/common/background_container.dart';
import 'package:houta_vendor/common/custom_button.dart';
import 'package:houta_vendor/common/reusable_text.dart';
import 'package:houta_vendor/constants/constants.dart';
import 'package:houta_vendor/controllers/login_controller.dart';
import 'package:houta_vendor/models/login_model.dart';
import 'package:houta_vendor/views/auth/regitration_page.dart';
import 'package:houta_vendor/views/auth/widget/email_textfield.dart';
import 'package:houta_vendor/views/auth/widget/password_textfield.dart';
import 'package:houta_vendor/views/home/home_page.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimary,
        title: Center(
          child: ReusableText(
            text: "Houta Login",
            style: appStyle(20, kLightWhite, FontWeight.bold),
          ),
        ),
      ),
      body: BackGroundContainer(
        color: Colors.white,
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    EmailTextField(
                      hintText: "UserName",
                      prefixIcon: const Icon(
                        CupertinoIcons.mail,
                        size: 22,
                      ),
                      controller:_nameController ,
                    ),
                  
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                              onTap: () {
                               
                              },
                              child: ReusableText(
                                  text: "register",
                                  style: appStyle(
                                      12, Colors.blue, FontWeight.normal))),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomButton(
                      btnColor: kPrimary,
                      text: "L O G I N",
                      btnHeight: 35.h,
                      btnWidth: width,
                      onTap: () {
                          final box= GetStorage();

                                  box.write("username",_nameController.text );
                                Get.to(HomePage());
                                
                   
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
