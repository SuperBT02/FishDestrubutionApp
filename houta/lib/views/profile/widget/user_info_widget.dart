import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:houta/common/app_style.dart';
import 'package:houta/common/reusable_text.dart';
import 'package:houta/constants/constants.dart';
import 'package:houta/models/login_response.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({
    super.key, this.user,
  });
  final LoginResponse? user;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.06,
      width: width,
       color: kLightWhite,
      child: Column(
        children: [Padding(padding: EdgeInsets.fromLTRB(12.w, 0, 16, 0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Row(children: [
                CircleAvatar(
            radius: 23.r,
            backgroundColor: kSecondary,
            backgroundImage: NetworkImage(user!.profile)),
            SizedBox(
              width: 10.w,
            ),
    
    
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                        ReusableText(text: user!.username??"Username", style: appStyle(10, kDark, FontWeight.w300)),
                        ReusableText(text: user!.email??"default@gmail.com", style: appStyle(9, kDark, FontWeight.w200)),
                      ],
                    )
    
    
            ],),
            ReusableText(text: "text", style: appStyle(14, kDark, FontWeight.normal)),
          ],
        ),),],
      ),
    );
  }
}