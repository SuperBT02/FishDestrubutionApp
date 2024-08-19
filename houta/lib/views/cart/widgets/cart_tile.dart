import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:houta/common/app_style.dart';
import 'package:houta/common/reusable_text.dart';
import 'package:houta/constants/constants.dart';
import 'package:houta/controllers/cart_controller.dart';
import 'package:houta/models/cart_response.dart';
import 'package:houta/models/offers_model.dart';
import 'package:houta/views/offer/offer_page.dart';

class CartTile extends StatelessWidget {
  const CartTile({super.key, required this.cart, this.color, this.refetch});
  final CartResponse cart;
  final Color? color;
  final Function ()? refetch;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());
    return GestureDetector(
        onTap: () {
          // Get.to(()=> OfferPage(offer: offer));
        },
        child: Stack(
          clipBehavior: Clip.hardEdge,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 8.h),
              height: 70.h,
              width: width,
              decoration: BoxDecoration(
                  color: color??kOffWhite, borderRadius: BorderRadius.circular(9.r)),
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
                              cart.productId.imageUrl,
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
                            text: cart.productId.title,
                            style: appStyle(11, kDark, FontWeight.w400)),
                        /* ReusableText(
                            text: "Delivery time: ${cart.productId.time}",
                            style: appStyle(11, kGray, FontWeight.w400)), */
                        SizedBox(
                          width: width * 0.7,
                          child: Text(
                            'Quantity: ${cart.quantity.toStringAsFixed(0)}',
                            overflow: TextOverflow.ellipsis,
                            style: appStyle(11, kGray, FontWeight.bold),
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
                    color: kPrimary,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                    child: ReusableText(
                        text: "\$ ${cart.totalPrice.toStringAsFixed(2)}",
                        style: appStyle(11, kLightWhite, FontWeight.w600)),
                  ),
                )),
            Positioned(
                right: 75.w,
                top: 6.h,
                child: GestureDetector(
                  onTap: () {
                    controller.RemoveFromCart(cart.id, refetch!);
                  },
                  child: Container(
                    width: 19.w,
                    height: 19.h,
                    decoration: BoxDecoration(
                      color: kRed,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: const Center(
                      child: Icon(
                        MaterialCommunityIcons.trash_can_outline,
                        size: 15,
                        color: kLightWhite,
                      ),
                    ),
                  ),
                ))
          ],
        ));
  }
}
