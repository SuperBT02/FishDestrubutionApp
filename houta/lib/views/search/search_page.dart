import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:houta/common/custom_container.dart';
import 'package:houta/common/custom_text_field.dart';
import 'package:houta/common/shimmers/foodlist_shimmer.dart';
import 'package:houta/constants/constants.dart';
import 'package:houta/controllers/search_controller.dart';
import 'package:houta/views/search/loading_widget.dart';
import 'package:houta/views/search/search_results.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchOfferController());
    return Obx(
      () => Scaffold(
        backgroundColor: kPrimary,
        appBar: AppBar(
          toolbarHeight: 65.h,
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Padding(
            padding: EdgeInsets.only(top: 12.h),
            child: CustomTextWidget(
              controller: _searchController,
              keyboardType: TextInputType.text,
              hintText: "What you're searching for ?",
              suffixIcon: GestureDetector(
                  onTap: () {
                    if(controller.isTriggered == false){
                      controller.searchOffers(_searchController.text);
                      controller.setTrigger = true;
                    }else{
                      controller.searchResults = null;
                      controller.setTrigger = false;
                      _searchController.clear();
                    }
                    controller.searchOffers(_searchController.text);
                  },
                  child: controller.isTriggered == false 
                  ? const Icon(Ionicons.search_circle,
                      size: 38, color: kPrimary)
                   :const Icon(Ionicons.close_circle,
                      size: 38, color: kRed)),
            ),
          ),
        ),
        body: SafeArea(
            child: CustomContainer(
                color: Colors.white,
                ContainerContent: controller.isLoading 
                ? const FoodsListShimmer() 
                :controller.searchResults == null ? const  LoadingWidget()
                : const SearchResults()),
                ),
      ),
    );
  }
}
