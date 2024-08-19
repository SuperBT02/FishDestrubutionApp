import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:houta_vendor/common/custom_button.dart';
import 'package:houta_vendor/common/custom_container.dart';
import 'package:houta_vendor/constants/constants.dart';
import 'package:houta_vendor/controllers/login_controller.dart';
import 'package:houta_vendor/models/login_response.dart';
import 'package:houta_vendor/views/auth/login_redirect.dart';
import 'package:houta_vendor/views/auth/verification_page.dart';
import 'package:houta_vendor/views/profile/widget/profile_appbar.dart';
import 'package:houta_vendor/views/profile/widget/profile_tile_widget.dart';

import 'widget/user_info_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    LoginResponse? user;
    final controller = Get.put(LoginController());
    final box = GetStorage();
    String? token =box.read('token');
    if(token!=null){
      user=controller.getUserInfo();
      print(user!.email);
    }
    if(user!=null && user.verification == false){
      return const VerificationPage();
    }
    if(token == null){
      return const LoginRedirectPage();
    }
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.h),
        child: ProfileAppBar(),
      ),
      body: SafeArea(
          child: CustomContainer(
              ContainerContent: Column(
        children: [
          //userInofo widget
           UserInfoWidget(user: user),
          SizedBox(height: 10.h,),
          Container(
            height: 155.h,
            decoration: const BoxDecoration(
              color: kLightWhite,
             ),
             child: ListView(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ProfilTileWidget(onTap: (){
                  Get.to(()=>LoginRedirectPage());
                },title: "My Orders", icon: Ionicons.cart_outline),
                ProfilTileWidget(onTap: (){},title: "Reviews", icon: Ionicons.chatbubble_outline),
                ProfilTileWidget(onTap: (){},title: "Coupons", icon: MaterialCommunityIcons.tag_outline),
              ],
             ),
          ),
          SizedBox(
            height: 20.h,
          ),


          Container(
            height: 200.h,
            decoration: const BoxDecoration(
              color: kLightWhite,
             ),
             child: ListView(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ProfilTileWidget(onTap: (){},title: "Home Address", icon: SimpleLineIcons.location_pin),
                ProfilTileWidget(onTap: (){},title: "Customer Service", icon: AntDesign.customerservice),
                ProfilTileWidget(onTap: (){},title: "App FeedBack", icon: MaterialIcons.rss_feed),
                ProfilTileWidget(onTap: (){},title: "Settings", icon: AntDesign.setting),
                
              ],
             ),
          ),

          SizedBox(
            height: 20.h,
          ),
          CustomButton(
            onTap: (){
              controller.logout();
            },
            btnColor: kRed,
            text:"Log Out", btnRadius: 0,),
        ],
      ))),
    );
  }
}
