import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:houta_vendor/common/app_style.dart';
import 'package:houta_vendor/common/reusable_text.dart';
import 'package:houta_vendor/constants/constants.dart';
import 'package:houta_vendor/models/offers.dart';

class OfferTile extends StatelessWidget {
  const OfferTile({
    super.key,
    required this.offer,
  });

  final OffersModel offer;


  @override
  Widget build(BuildContext context) {
    print(offer);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 4),
      child: (Container(
          height: 76,
          decoration: BoxDecoration(
            color: kOffWhite,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Stack(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.w),
                    child: SizedBox(
                      width: 62.w,
                      height: 62.h,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child:
                            Image.network(offer.imageUrl, fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ReusableText(
                          text: offer.title,
                          style: appStyle(11, kDark, FontWeight.w500)),
                      ReusableText(
                          text: "Quantity Left:${offer.quantity}",
                          style: appStyle(12, kSecondary, FontWeight.bold)),
                    ],
                  )
                ],
              ),
              Positioned(
                right: 5.w,
                top: 5.w,
                child: Container(
                  height: 19.h,
                  width: 60.w,
                  decoration: BoxDecoration(
                      color: kPrimary,
                      borderRadius: BorderRadius.circular(12.r)),
                  child: Center(
                    child: ReusableText(
                      text: "\$${offer.price.toStringAsFixed(2)}", 
                      style: appStyle(12, kLightWhite, FontWeight.bold)),
                  ),
                ),
              ),
            ],
          ))),
    );
  }
}
