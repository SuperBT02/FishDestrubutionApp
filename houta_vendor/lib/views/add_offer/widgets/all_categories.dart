import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:houta_vendor/common/app_style.dart';
import 'package:houta_vendor/common/reusable_text.dart';
import 'package:houta_vendor/constants/constants.dart';
import 'package:houta_vendor/constants/uidata.dart';
import 'package:houta_vendor/controllers/offer_controller.dart';

class ChooseCategory extends HookWidget {
  const ChooseCategory({required this.next, super.key});

  final Function() next;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OfferController());
    return  SizedBox(
      height: height,
      child: ListView(
        children: [
          Padding(
            padding:  EdgeInsets.only(left:16.w, top: 12.h, bottom:12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableText(text: "Pick Category", style: appStyle(16, kGray, FontWeight.w600)),
                ReusableText(text: "Pick a Category to continue adding your offer", style: appStyle(11, kGray, FontWeight.normal)),
              ],
            ),
          ),

          SizedBox(
            height: height *0.8,
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context,i){
                final category= categories[i];
                return ListTile(
                  onTap: (){
                    controller.setCategory = category["_id"];
                    next();
                  },
                  leading: CircleAvatar(
                    radius: 18.r,
                    backgroundColor: kPrimary,
                    child: Image.network(category['imageUrl'], fit:BoxFit.contain),
                  ),
                  title: ReusableText(text: category['title'],style: appStyle(12, kGray, FontWeight.normal)),
                  trailing:Icon(Icons.arrow_forward_ios, color: kGray, size: 15.sp,)
                );
              }),
          )
        ],
      )
    );
  }
}