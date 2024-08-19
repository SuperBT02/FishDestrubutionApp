import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:houta/common/app_style.dart';
import 'package:houta/common/reusable_text.dart';
import 'package:houta/constants/constants.dart';
import 'package:houta/controllers/category_controller.dart';
import 'package:houta/models/categories.dart';
import 'package:houta/views/categories/category_page.dart';

class CategoryTile extends StatelessWidget {
  CategoryTile({
    super.key,
    required this.category,
  });

  CategoriesModel category;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return ListTile(
      onTap: () {
          controller.updateCategory = category.id;
          controller.updateTitle = category.title;
        Get.to(
          () => const CategoryPage(),
          transition: Transition.fadeIn,
          duration: const Duration(milliseconds: 200),
        );
      },
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: kGrayLight,
        child: Image.network(
          category.imageUrl,
          fit: BoxFit.contain,
        ),
      ),
      title: ReusableText(
          text: category.title,
          style: appStyle(12, kGray, FontWeight.normal)),
      trailing: const Icon(
        Icons.arrow_forward_ios_rounded,
        color: kGray,
        size: 15,
      ),
    );
  }
}
