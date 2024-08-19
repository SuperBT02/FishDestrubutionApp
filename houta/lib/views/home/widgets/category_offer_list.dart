import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:houta/common/shimmers/foodlist_shimmer.dart';
import 'package:houta/constants/constants.dart';
import 'package:houta/hooks/fetch_category_offers.dart';
import 'package:houta/models/offers_model.dart';
import 'package:houta/views/home/widgets/offer_tile.dart';

class CategoryOfferList extends HookWidget {
  const CategoryOfferList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchOfferByCategory("41007428");
    List<OffersModel>? offers = hookResults.data;
    final isLoading = hookResults.isLoading;
    return SizedBox(
      width: width,
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
    );
  }
}