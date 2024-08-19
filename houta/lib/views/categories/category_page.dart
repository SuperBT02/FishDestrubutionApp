import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:houta/common/app_style.dart';
import 'package:houta/common/background_container.dart';
import 'package:houta/common/reusable_text.dart';
import 'package:houta/common/shimmers/foodlist_shimmer.dart';
import 'package:houta/constants/constants.dart';
import 'package:houta/controllers/category_controller.dart';
import 'package:houta/hooks/fetch_category_offers.dart';
import 'package:houta/models/offers_model.dart';
import 'package:houta/views/home/widgets/offer_tile.dart';

class CategoryPage extends HookWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    final hookResults = useFetchOfferByCategory("41007428");
    List<OffersModel>? offers = hookResults.data;
    final isLoading = hookResults.isLoading;
    return  Scaffold(
      appBar: AppBar(
        title: ReusableText(text: "${controller.titleValue} Category", style: appStyle(14, kDark, FontWeight.w600)),
        elevation: 0,
        backgroundColor: kOffWhite,
        leading: IconButton(
          onPressed: (){
            controller.updateCategory = '';
            controller.updateTitle = '';
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios, color: kDark,),
          color: kGray),
      ),
      body: BackGroundContainer(
        color: Colors.white,
        child: SizedBox(
         // padding: const EdgeInsets.only(left: 12, top: 10),
          height: height,
          child: isLoading
              ? const FoodsListShimmer()
              : Padding(
                padding: EdgeInsets.all(12.h),
                child: ListView(
                  children: List.generate(offers!.length, (i) {
                    OffersModel offer = offers[i];
                    return OfferTile(
                      offer: offer,
                    );
                  }),
                ),
              ),
        ),
      ),
      );
  }
}