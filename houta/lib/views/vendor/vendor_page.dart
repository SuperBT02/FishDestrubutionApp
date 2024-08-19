import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:houta/common/app_style.dart';
import 'package:houta/common/reusable_text.dart';
import 'package:houta/constants/constants.dart';
import 'package:houta/models/vendors_model.dart';
import 'package:houta/views/vendor/directions_page.dart';
import 'package:houta/views/vendor/widget/recommendation_widget.dart';
import 'package:houta/views/vendor/widget/vendor_menu.dart';
import 'widget/row_text.dart';
import 'widget/vendor_buttom_bar.dart';

class VendorPage extends StatefulWidget {
  const VendorPage({super.key, required this.vendor});
  final VendorsModel? vendor;

  @override
  State<VendorPage> createState() => _VendorPageState();
}

class _VendorPageState extends State<VendorPage> with TickerProviderStateMixin {
  // ignore: prefer_final_fields
  late TabController _tabController = TabController(
    length: 2,
    vsync: this,
  );
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: kLightWhite,
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 230.h,
                  width: width,
                  child: CachedNetworkImage(
                      fit: BoxFit.cover, imageUrl: widget.vendor!.imageUrl),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    width: width,
                    height: 40.h,
                    decoration: BoxDecoration(
                        color: kPrimary.withOpacity(0.4),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.r),
                            topLeft: Radius.circular(10.r))),
                    child: VendorButtomBar(widget: widget),
                  ),
                ),
                Positioned(
                  top: 45.h,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: const Icon(Ionicons.chevron_back_circle,
                                size: 28, color: kLightWhite)),
                        ReusableText(
                            text: widget.vendor!.title,
                            style: appStyle(17, kDark, FontWeight.w700)),
                        GestureDetector(
                            onTap: () {
                              Get.to(() => const DirectionsPage());
                            },
                            child: const Icon(Ionicons.location,
                                size: 28, color: kLightWhite)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Column(
                children: [
                  const RowText(
                      first: "Distance To Restaurant", second: "2.7 km"),
                  SizedBox(
                    height: 3.h,
                  ),
                  const RowText(first: "Estimated Time", second: "30 min"),
                  const Divider(
                    thickness: 0.7,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Container(
                height: 30.h,
                width: width,
                decoration: BoxDecoration(
                  color: kOffWhite,
                  borderRadius: BorderRadius.circular(25.r),
                ),
                child: TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(
                    color: kPrimary,
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  labelPadding: EdgeInsets.zero,
                  labelColor: kLightWhite,
                  unselectedLabelColor: kGrayLight,
                  labelStyle: appStyle(12, kLightWhite, FontWeight.normal),
                  tabs: [
                    Tab(
                      child: SizedBox(
                        width: width / 2,
                        height: 25,
                        child: Center(
                          child: Text("Offers"),
                        ),
                      ),
                    ),
                    Tab(
                      child: SizedBox(
                        width: width / 2,
                        height: 25,
                        child: const Center(
                          child: Text("Recommendations"),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
              SizedBox(height: 20,),
            Padding(padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: SizedBox(
              height: height,
              child: TabBarView(
                controller: _tabController,
                children: [
                  VendorMenuWidget(vendorId: widget.vendor!.id,),
                   RecommendationMenuWidget(code: widget.vendor!.code,),
                ],),
            ),)
          ],
        ),
      ),
    );
  }
}
