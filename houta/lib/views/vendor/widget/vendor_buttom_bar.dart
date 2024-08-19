import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:houta/common/custom_buttom.dart';
import 'package:houta/constants/constants.dart';
import 'package:houta/views/vendor/rating_page.dart';
import 'package:houta/views/vendor/vendor_page.dart';

class VendorButtomBar extends StatelessWidget {
  const VendorButtomBar({
    super.key,
    required this.widget,
  });

  final VendorPage widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RatingBarIndicator(
          itemCount: 5,
          itemSize: 25,
          rating: widget.vendor!.rating.toDouble(),
          itemBuilder: (context, i) =>const Icon(Icons.star, color: Colors.yellow)),
          CustomButton(
            onTap: () {
              Get.to(()=> const RatingPage());
            },
            btncolor: kSecondary,
            btnWidth: 110.w,
            text: "Rate Vendor")
      ],
    );
  }
}
