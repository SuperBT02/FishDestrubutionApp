import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:houta/common/shimmers/nearby_shimmer.dart';
import 'package:houta/hooks/fetch_vendors.dart';
import 'package:houta/models/vendors_model.dart';
import 'package:houta/views/home/widgets/vendor_widget.dart';
import 'package:houta/views/vendor/vendor_page.dart';

class NearbyVendors extends HookWidget {
  const NearbyVendors({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchVendor("41007422");
    final isLoading = hookResults.isLoading;
    List<VendorsModel> ?vendors = hookResults.data;
    return isLoading ? const NearbyShimmer(): Container(
      height: 190,
      padding: const EdgeInsets.only(left: 20, top: 10),
      child:ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(vendors!.length, (i) {
          VendorsModel vendor = vendors[i];
          return VendorWidget(
            onTap:(){
              Get.to(()=>VendorPage(vendor: vendor));
            } ,
              image: vendor.imageUrl,
              logo: vendor.logoUrl,
              title: vendor.title,
              time: vendor.time,
              rating: vendor.ratingCount);
        }),
      ),
    );
  }
}
