import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:houta_vendor/common/home_tile.dart';
import 'package:houta_vendor/constants/constants.dart';
import 'package:houta_vendor/views/add_offer/add_offers.dart';
import 'package:houta_vendor/views/home/offer/offer_list.dart';

class HomeTiles extends StatelessWidget {
  const HomeTiles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.w),
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      height: 70.h,
      decoration: BoxDecoration(
          color: kOffWhite, borderRadius: BorderRadius.circular(12.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          HomeTile(
              onTap: () {
                Get.to(()=>const AddOffers(),
                transition: Transition.fadeIn,
                duration: const Duration(milliseconds: 600));
              },
              text: "Add Offer",
              iconPath: "assets/icons/taco.svg"),
          SizedBox(
            width: 40.w,
          ),
          HomeTile(
              onTap: () {
                String temp_id = "65ffef82a9e6a95f88721773";
                Get.to(()=> OfferList(),
                transition: Transition.fadeIn,
                duration: const Duration(milliseconds: 600));
              },
              text: "My Offers",
              iconPath: "assets/icons/taco.svg"),
        ],
      ),
    );
  }
}
