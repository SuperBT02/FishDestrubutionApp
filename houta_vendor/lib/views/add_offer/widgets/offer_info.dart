import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:houta_vendor/common/app_style.dart';
import 'package:houta_vendor/common/custom_button.dart';
import 'package:houta_vendor/common/custom_texfield.dart';
import 'package:houta_vendor/common/reusable_text.dart';
import 'package:houta_vendor/constants/constants.dart';
import 'package:houta_vendor/controllers/offer_controller.dart';

class OfferInfo extends StatelessWidget {
  const OfferInfo(
      {super.key,
      required this.back,
      required this.next,
      required this.title,
      required this.description,
      required this.price,
      required this.quantity,
      required this.types,
      required this.tags, required this.isAvailable});
  final Function back;
  final Function next;
  final TextEditingController title;
  final TextEditingController description;
  final TextEditingController price;
  final TextEditingController quantity;
  final TextEditingController types;
  final TextEditingController tags;
  final TextEditingController isAvailable;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OfferController());
    return SizedBox(
        height: height,
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16.w, top: 12.h, bottom: 12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableText(
                      text: "Add Details",
                      style: appStyle(16, kGray, FontWeight.w600)),
                  ReusableText(
                      text: "You are required to information correctly",
                      style: appStyle(11, kGray, FontWeight.normal)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  CustomTextField(
                      controller: title,
                      hintText: "Title",
                      prefixIcon: const Icon(Icons.keyboard_capslock)),
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomTextField(
                      controller: description,
                      hintText: "description",
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      prefixIcon: const Icon(Icons.keyboard_capslock)),
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomTextField(
                      controller: quantity,
                      hintText: " Offer Quantity e.g : 4",
                      keyboardType: TextInputType.number,
                      prefixIcon: const Icon(
                          Icons.production_quantity_limits_outlined)),
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomTextField(
                      controller: price,
                      hintText: "Price",
                      keyboardType: TextInputType.number,
                      prefixIcon: const Icon(Icons.attach_money_outlined)),
                  SizedBox(
                    height: 3.h,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.w, top: 5.h, bottom: 12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableText(
                      text: "Add Offer Types adn Tags",
                      style: appStyle(16, kGray, FontWeight.w600)),
                  ReusableText(
                      text: "Types and Tags will helps with offer search",
                      style: appStyle(11, kGray, FontWeight.normal)),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(5.0),
                child: Obx(
                  () => Column(
                    children: [
                      CustomTextField(
                          controller: types,
                          hintText: "Big fish / Fresh / Natural ",
                          prefixIcon: const Icon(Icons.tag_outlined)),
                      SizedBox(
                        height: 15.h,
                      ),
                      controller.types.isNotEmpty
                          ? Row(
                              children:
                                  List.generate(controller.types.length, (i) {
                                return Container(
                                  margin: EdgeInsets.only(right: 5.w),
                                  decoration: BoxDecoration(
                                    color: kPrimary,
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      child: ReusableText(
                                          text: controller.types[i],
                                          style: appStyle(
                                              9, kWhite, FontWeight.normal)),
                                    ),
                                  ),
                                );
                              }),
                            )
                          : const SizedBox.shrink(),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomButton(
                        text: "Add Offer Type",
                        onTap: () {
                          controller.setTypes = types.text;
                          types.text = "";
                        },
                        btnRadius: 6.r,
                        btnColor: kSecondary,
                      ),
                    ],
                  ),
                )),
            Padding(
                padding: const EdgeInsets.all(12.0),
                child: Obx(
                  () => Column(
                    children: [
                      CustomTextField(
                          controller: tags,
                          hintText: "new , fresh ",
                          prefixIcon: const Icon(Icons.tag_outlined)),
                      SizedBox(
                        height: 5.h,
                      ),
                      controller.tags.isNotEmpty
                          ? Row(
                              children:
                                  List.generate(controller.tags.length, (i) {
                                return Container(
                                  margin: EdgeInsets.only(right: 5.w),
                                  decoration: BoxDecoration(
                                    color: kPrimary,
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      child: ReusableText(
                                          text: controller.tags[i],
                                          style: appStyle(
                                              9, kWhite, FontWeight.normal)),
                                    ),
                                  ),
                                );
                              }),
                            )
                          : const SizedBox.shrink(),
                      SizedBox(
                        height: 15.h,
                      ),
                      CustomButton(
                        text: "Add Offer Tags",
                        onTap: () {
                          controller.setTags = tags.text;
                          tags.text = "";
                        },
                        btnRadius: 6.r,
                        btnColor: kSecondary,
                      ),
                    ],
                  ),
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("is Available"),
                    Switch(value: isAvailable.text == "true" ? true :false, onChanged: (value){
                      isAvailable.text = value.toString();
                    })
                  ],
                ),
            
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                      text: "Back",
                      onTap: () {
                        back();
                      },
                      btnWidth: width / 2.3,
                      btnRadius: 6.r),
                  CustomButton(
                      text: "Next",
                      onTap: () {},
                      btnWidth: width / 2.3,
                      btnRadius: 9.r),
                ],
              ),
            )
          ],
        ));
  }
}
