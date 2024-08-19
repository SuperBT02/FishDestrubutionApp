import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:houta/common/shimmers/categories_shimmer.dart';
import 'package:houta/hooks/fetch_categories.dart';
import 'package:houta/models/categories.dart';

import 'category_widget.dart';

class CategoryList extends HookWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchCategories();
    List<CategoriesModel> ?categoriesList = hookResult.data;
    final isLoading = hookResult.isLoading;
    // ignore: unused_local_variable
    final error = hookResult.error;
    return Container(
      height: 84,
      padding: const EdgeInsets.only(left: 20, top: 10),
      child: isLoading
          ? const CatergoriesShimmer()
          : ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(categoriesList!.length, (i) {
                CategoriesModel category = categoriesList[i];
                return CategoryWidget(category: category);
              }),
            ),
    );
  }
}
