import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:houta/common/shimmers/foodlist_shimmer.dart';
import 'package:houta/constants/constants.dart';
import 'package:houta/hooks/offers_by_vendors.dart';
import 'package:houta/models/offers_model.dart';
import 'package:houta/views/home/widgets/offer_tile.dart';

class VendorMenuWidget extends HookWidget {
  const VendorMenuWidget({super.key, required this.vendorId});
  final String vendorId;

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchOfferByVendors(vendorId);
    final offers = hookResults.data;
    final isLoading = hookResults.isLoading;
    return Scaffold(
      backgroundColor: kLightWhite,
      body: isLoading
          ? const FoodsListShimmer()
          : SizedBox(
              height: height * 0.7,
              child: ListView(
                padding: EdgeInsets.zero,
                children: List.generate(offers.length, (index) {
                  final OffersModel offer = offers[index];
                  return OfferTile(
                    offer: offer,
                  );
                }),
              ),
            ),
    );
  }
}
