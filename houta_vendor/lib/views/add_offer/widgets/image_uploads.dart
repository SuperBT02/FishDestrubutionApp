import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:houta_vendor/common/app_style.dart';
import 'package:houta_vendor/common/custom_button.dart';
import 'package:houta_vendor/common/reusable_text.dart';
import 'package:houta_vendor/constants/constants.dart';
import 'package:houta_vendor/controllers/uploader_controller.dart';

class ImageUploads extends StatelessWidget {
  const ImageUploads({super.key, required this.back, required this.next});
  final Function back;
  final Function next;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UploaderController());
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
                      text: "Upload Images",
                      style: appStyle(16, kGray, FontWeight.w600)),
                  ReusableText(
                      text: "You are required to upload the image",
                      style: appStyle(11, kGray, FontWeight.normal)),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: height * 0.8,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Column(
                  children: [
                    // ImageOne is the the image of the offer that will be published
                    GestureDetector(
                        onTap: () {
                          controller.pickImage();
                        },
                        child: Obx(
                          () => Container(
                            height: 180.h,
                            width: width / 1.6,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(color: kGray),
                            ),
                            child:controller.imageOneUrl ==''? Center(
                              child: ReusableText(
                                  text: "Upload Your Image",
                                  style: appStyle(16, kGray, FontWeight.w600)),
                            ):ClipRRect(
                              borderRadius: BorderRadius.circular(10.r),
                              child:Image.network(
                                controller.imageOneUrl,
                                fit:BoxFit.cover,
                              ),
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 25.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton(
                            text: "Back",
                            onTap: () {
                              back();
                            },
                            btnWidth: width / 2.3,
                            btnRadius: 9.r),
                        CustomButton(
                            text: "Next",
                            onTap: () {
                              if(controller.image != ''){
                              next();}else{
                                Get.snackbar(
                                  colorText: kLightWhite,
                                  backgroundColor: kPrimary,
                                  snackPosition: SnackPosition.TOP,
                                  "error", "Please upload the image");
                              }
                            },
                            btnWidth: width / 2.3,
                            btnRadius: 9.r),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
