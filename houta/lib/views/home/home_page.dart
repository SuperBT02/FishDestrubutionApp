import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:houta/common/custom_appbar.dart';
import 'package:houta/common/custom_container.dart';
import 'package:houta/common/heading.dart';
import 'package:houta/constants/constants.dart';
import 'package:houta/controllers/category_controller.dart';
import 'package:houta/views/home/all_nearby_vendors.dart';
import 'package:houta/views/home/newest_offers.dart';
import 'package:houta/views/home/popular_offers.dart';
import 'package:houta/views/home/widgets/category_list.dart';
import 'package:houta/views/home/widgets/category_offer_list.dart';
import 'package:houta/views/home/widgets/vendors_list.dart';
import 'package:houta/views/home/widgets/offers_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(130),
        child: CustomAppbar(),
      ),
      body: SafeArea(
          child: CustomContainer(
              ContainerContent: Column(
        children: [
          const CategoryList(),
          Obx(
            () => controller.categoryValue == ''
                ? Column(
                    children: [
                      Heading(
                        text: "Nearby Vendors",
                        onTap: () {
                          Get.to(() => const AllNearbyVendors(),
                              transition: Transition.cupertino,
                              duration: const Duration(milliseconds: 300));
                        },
                      ),
                      const NearbyVendors(),
                      Heading(
                        text: "Recommended Offers",
                        onTap: () {
                          Get.to(() => const PopularOffers(),
                              transition: Transition.cupertino,
                              duration: const Duration(milliseconds: 300));
                        },
                      ),
                      const OffersList(),
                      Heading(
                        text: "Offers Close to You",
                        onTap: () {
                          Get.to(() => const NewestOffers(),
                              transition: Transition.cupertino,
                              duration: const Duration(milliseconds: 300));
                        },
                      ),
                      const OffersList(),
                    ],
                  )
                : CustomContainer(
                    ContainerContent: Column(
                    children: [
                      Heading(
                        more: true,
                        text: "Explore ${controller.titleValue} Category",
                        onTap: () {
                          Get.to(() => const AllNearbyVendors(),
                              transition: Transition.cupertino,
                              duration: const Duration(milliseconds: 300));
                        },
                      ),

                      const CategoryOfferList()
                    ],
                  )),
          )
        ],
      ))),
    );
  }
}
