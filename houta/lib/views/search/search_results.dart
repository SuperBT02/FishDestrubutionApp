import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:houta/constants/constants.dart';
import 'package:houta/controllers/search_controller.dart';
import 'package:houta/models/offers_model.dart';
import 'package:houta/views/home/widgets/offer_tile.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get. put(SearchOfferController());
    return Container(
      padding: EdgeInsets.fromLTRB(12.w, 10.h, 12.h, 0),
      height: height,
      child: ListView.builder(
        itemCount: controller.searchResults!.length,
        itemBuilder: (context, i){
          OffersModel offer = controller.searchResults![i];
          return OfferTile(offer: offer);
        }),
    );
  }
}