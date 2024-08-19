import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:houta/common/app_style.dart';
import 'package:houta/common/background_container.dart';
import 'package:houta/common/custom_buttom.dart';
import 'package:houta/common/reusable_text.dart';
import 'package:houta/constants/constants.dart';
import 'package:houta/controllers/registration_controller.dart';
import 'package:houta/models/registration_model.dart';
import 'package:houta/views/auth/widget/email_textfiled.dart';
import 'package:houta/views/auth/widget/password_textfield.dart';
import 'package:lottie/lottie.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<RegistrationPage> {
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _passwordController =TextEditingController();
  late final TextEditingController _userController =TextEditingController();

  final FocusNode _passwordFocusNode = FocusNode();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegistrationController());
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimary,
        title: Center(
          child: ReusableText(
            text: "Houta Register",
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
                      hintText: "Username",
                      prefixIcon: const Icon(
                        CupertinoIcons.profile_circled,
                        size: 22,
                      ),
                      controller: _userController,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    PasswordTextField(
                      controller: _passwordController,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    EmailTextField(
                      hintText: "Email",
                      prefixIcon: const Icon(
                        CupertinoIcons.mail,
                        size: 22,
                      ),
                      controller: _emailController,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),

                    CustomButton(
                      onTap: () {
                        if (_emailController.text.isNotEmpty &&
                            _userController.text.isNotEmpty &&
                            _passwordController.text.length >= 8) {
                          RegistrationModel model = RegistrationModel(
                              username: _userController.text,
                              email: _emailController.text,
                              password: _passwordController.text);
                              String data = registrationModelToJson(model);
                              controller.RegistrationFunction(data);
                        }
                      },
                      btncolor: kPrimary,
                      text: "R E G I S T E R",
                      btnHeight: 35.h,
                      btnWidth: width,
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
