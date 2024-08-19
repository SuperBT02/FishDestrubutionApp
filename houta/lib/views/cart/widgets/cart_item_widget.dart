import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:houta/common/app_style.dart';
import 'package:houta/common/reusable_text.dart';
import 'package:houta/constants/constants.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({super.key, required this.image, required this.title, required this.price, required this.quantity});

  final String image;
  final String title;
  final String price;
  final int quantity;



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:10,right: 12),
      child: Container(
        width: width * .5,
        height: 180.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: kLightWhite,
        ),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Padding(
              padding: EdgeInsets.all(8.w),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: SizedBox(
                    height: 90.h,
                    width: width * 0.8,
                    child: Image.network(
                     image,scale: 0.5,
                      fit: BoxFit.fitWidth,
                    ),
                  )),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ReusableText(
                            text: title,
                            style: appStyle(12, kDark, FontWeight.w500)),
                         Column(
                           children: [
                             ReusableText(
                                text: '\$ $price',
                                style: appStyle(12, kPrimary, FontWeight.w600)),
                                ReusableText(
                                text: '$quantity \Kg',
                                style: appStyle(12, kSecondary, FontWeight.w600)),
                           ],
                         ),
                      ],
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}