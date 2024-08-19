import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:houta_vendor/common/app_style.dart';
import 'package:houta_vendor/constants/constants.dart';

class HomeTabs extends StatelessWidget {
  const HomeTabs({
    super.key,
    required TabController tabContoller,
  }) : _tabContoller = tabContoller;

  final TabController _tabContoller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Container(
        margin: EdgeInsets.zero,
        height: 35.h,
        width: width,
        decoration:BoxDecoration(
          color:kOffWhite,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: TabBar(
          //isScrollable: true,
          
          controller: _tabContoller,
          indicator: BoxDecoration(
            color:kPrimary,
            borderRadius: BorderRadius.circular(15.r)
          ),
          labelColor: kLightWhite,
         // indicatorWeight: 1,
          dividerColor: Colors.transparent,
          unselectedLabelColor: kGrayLight,
          tabAlignment: TabAlignment.fill,
          labelStyle: appStyle(12, kLightWhite, FontWeight.w600),
          labelPadding: EdgeInsets.zero,
          tabs: List.generate(orderList.length, (index) {
            return Text(orderList[index]);
          }),
        ),
      ),
    );
  }
}
