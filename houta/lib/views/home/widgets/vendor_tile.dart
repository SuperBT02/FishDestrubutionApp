// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:houta/common/app_style.dart';
import 'package:houta/common/reusable_text.dart';
import 'package:houta/constants/constants.dart';
import 'package:houta/models/vendors_model.dart';
import 'package:houta/views/vendor/vendor_page.dart';

class VendorTile extends StatelessWidget {
  const VendorTile({super.key, required this.vendor});
  final VendorsModel vendor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Get.to(()=> VendorPage(vendor: vendor));
        },
        child: Stack(
          clipBehavior: Clip.hardEdge,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 8.h),
              height: 70.h,
              width: width,
              decoration: BoxDecoration(
                  color: kOffWhite, borderRadius: BorderRadius.circular(9.r)),
              child: Container(
                padding: EdgeInsets.all(4.r),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(12.r)),
                      child: Stack(
                        children: [
                          SizedBox(
                            width: 70.w,
                            height: 70.h,
                            child: Image.network(
                              vendor.imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            child: Container(
                              padding: EdgeInsets.only(left: 6.w, bottom: 2.h),
                              color: kGray.withOpacity(0.6),
                              height: 16.h,
                              width: width,
                              child: RatingBarIndicator(
                                rating: 5,
                                itemCount: 5,
                                itemBuilder: (context, i) => const Icon(
                                  Icons.star,
                                  color: kSecondary,
                                ),
                                itemSize: 15.h,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ReusableText(
                            text: vendor.title,
                            style: appStyle(11, kDark, FontWeight.w400)),
                        ReusableText(
                            text: "Working time: ${vendor.time}",
                            style: appStyle(11, kGray, FontWeight.w400)),
                        SizedBox(
                          width: width * 0.7,
                          child: Text(
                            vendor.coords.address,
                            overflow: TextOverflow.ellipsis,
                            style: appStyle(9, kGray, FontWeight.w400),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                right: 5.w,
                top: 6.h,
                child: Container(
                  width: 60.w,
                  height: 19.h,
                  decoration: BoxDecoration(
                    color:
                        vendor.isAvailable == true || vendor.isAvailable != null
                            ? kPrimary
                            : kSecondaryLight,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                    child: ReusableText(
                        text: vendor.isAvailable == true ||
                                vendor.isAvailable != null
                            ? "Working"
                            : "Closed",
                        style: appStyle(11, kLightWhite, FontWeight.w600)),
                  ),
                ))
          ],
        ));
  }
}
