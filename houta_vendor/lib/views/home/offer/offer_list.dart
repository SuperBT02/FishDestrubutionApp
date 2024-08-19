import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:houta_vendor/common/app_style.dart';
import 'package:houta_vendor/common/background_container.dart';
import 'package:houta_vendor/common/reusable_text.dart';
import 'package:houta_vendor/common/shimmers/foodlist_shimmer.dart';
import 'package:houta_vendor/constants/constants.dart';
import 'package:houta_vendor/constants/uidata.dart';
import 'package:houta_vendor/hooks/vendor_offers.dart';
import 'package:houta_vendor/models/offers.dart';

import 'Widgets/offer_tile.dart';

class OfferList extends HookWidget {
   OfferList({super.key, });
    final box= GetStorage();

  @override
  Widget build(BuildContext context) {
      final username = box.read("username");

    final hookResults =  useFetchOfferByVendors(username??"");
    final offers =  hookResults.data;
    final isLoading = hookResults.isLoading;
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        backgroundColor: kPrimary,
        title: Center(
            child: ReusableText(
          text: 'Offer List',
          style: appStyle(20, kLightWhite, FontWeight.w600),
        )),
      ),
      body: BackGroundContainer(
          child: Padding(
        padding: EdgeInsets.only(top: 20.h),
        child:username== null || username.isEmpty ? const Center(child: Text("please login to see your offers"),): isLoading ? FoodsListShimmer():  ListView(
                padding: EdgeInsets.zero,
                children: offers==null? [ Center(child: Text("wrong user"),)]: List.generate(offers.length , (index) {
                  final OffersModel offer = offers[index];

                  return  OfferTile(
                    offer: offer,
                  );
                }),
              ),
      )),
    );
  }
  
}
