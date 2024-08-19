import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:houta/common/app_style.dart';
import 'package:houta/common/background_container.dart';
import 'package:houta/common/reusable_text.dart';
import 'package:houta/common/shimmers/foodlist_shimmer.dart';
import 'package:houta/constants/constants.dart';
import 'package:houta/hooks/fetch_all_categories.dart';
import 'package:houta/models/categories.dart';

import 'widgets/category_tile.dart';

class AllCategorries extends HookWidget {
  const AllCategorries({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchAllCategories();
    List<CategoriesModel>? categories = hookResults.data;
    final isLoading = hookResults.isLoading;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kOffWhite,
        title: ReusableText(
            text: 'Categories', style: appStyle(12, kGray, FontWeight.w600)),
      ),
      body: BackGroundContainer(
        color: Colors.white,
        child: Container(
          padding: const EdgeInsets.only(left: 12, top: 10),
          height: height,
          child: isLoading
              ? const FoodsListShimmer()
              : ListView(
                  scrollDirection: Axis.vertical,
                  children: List.generate(categories!.length, (i) {
                    CategoriesModel category = categories[i];
                    return CategoryTile(category: category);
                  }),
                ),
        ),
      ),
    );
  }
}
