import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:houta/common/app_style.dart';
import 'package:houta/common/reusable_text.dart';
import 'package:houta/constants/constants.dart';
import 'package:houta/controllers/category_controller.dart';
import 'package:houta/models/categories.dart';
import 'package:houta/views/categories/all_categories.dart';

// ignore: must_be_immutable
class CategoryWidget extends StatelessWidget {
    CategoryWidget({
    super.key,
    required this.category,
  });

    CategoriesModel category;

  @override
  Widget build(BuildContext context) {
     final controller = Get.put(CategoryController());
    return GestureDetector(
      onTap: () {
        if (controller.categoryValue == category.id) {
          controller.updateCategory = '';
          controller.updateTitle = '';
        } 
        else if (category.value == 'more') {
          Get.to(() => const AllCategorries(),
              transition: Transition.fadeIn,
              duration: const Duration(milliseconds: 200));
        } 
        else {
          controller.updateCategory = category.id;
          controller.updateTitle = category.title;
        }
      },
      child:Obx(() => Container(
        margin: const EdgeInsets.only(right: 5),
        padding: const EdgeInsets.only(top: 4),
        width: width * 0.2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: controller.categoryValue == category.id? kSecondary : kOffWhite, width: 0.5)),
        child: Column(
          children: [
            SizedBox(
              height: 35,
              child: Image.network(
                category.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            ReusableText(
                text: category.title,
                style: appStyle(12, kDark, FontWeight.normal))
          ],
        ),
      ),
    ));
  }
}
