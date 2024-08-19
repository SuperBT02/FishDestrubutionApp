import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:houta/common/app_style.dart';
import 'package:houta/common/background_container.dart';
import 'package:houta/common/reusable_text.dart';
import 'package:houta/common/shimmers/foodlist_shimmer.dart';
import 'package:houta/constants/constants.dart';
import 'package:houta/hooks/fetch_all_offers.dart';
import 'package:houta/models/offers_model.dart';
import 'package:houta/views/home/widgets/offer_tile.dart';

class PopularOffers extends HookWidget {
  const PopularOffers({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchAllOffer("41007428");
    List<OffersModel>? offers = hookResults.data ?? [];
    final isLoading = hookResults.isLoading;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kOffWhite,
        title: ReusableText(
            text: 'recommended offers',
            style: appStyle(15, kGray, FontWeight.w600)),
      ),
      body: BackGroundContainer(
        color: Colors.white,
        child: isLoading
            ? const FoodsListShimmer()
            : Padding(
                padding: EdgeInsets.all(12.h),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: List.generate(offers!.length, (i) {
                    OffersModel offer = offers[i];
                    return OfferTile(
                      offer: offer,
                    );
                  }),
                ),
              ),
      ),
    );
  }
}
