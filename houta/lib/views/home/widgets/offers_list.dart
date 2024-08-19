import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:houta/common/shimmers/nearby_shimmer.dart';
import 'package:houta/hooks/fetch_offers.dart';
import 'package:houta/models/offers_model.dart';
import 'package:houta/views/home/widgets/offer_widget.dart';
import 'package:houta/views/offer/offer_page.dart';

class OffersList extends HookWidget {
  const OffersList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchOffer("41007428");
    print(hookResults.data);
    List<OffersModel> ?offers = hookResults.data;
    final isLoading = hookResults.isLoading;
    return Container(
      height: 190,
      padding: const EdgeInsets.only(left: 20, top: 10),
      child: isLoading
          ? const NearbyShimmer()
          : ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(offers!.length, (i) {
                OffersModel offer = offers[i];
                return OfferWidget(
                  onTap: () {
                      Get.to(()=> OfferPage(offer: offer));
                    },
                    image: offer.imageUrl,
                    title: offer.title,
                    time: offer.time,
                    price: offer.price.toStringAsFixed(2));
              }),
            ),
    );
  }
}
