import 'package:flutter/material.dart';
import 'package:houta_vendor/common/app_style.dart';
import 'package:houta_vendor/common/background_container.dart';
import 'package:houta_vendor/common/reusable_text.dart';
import 'package:houta_vendor/constants/constants.dart';
import 'package:houta_vendor/views/add_offer/widgets/all_categories.dart';
import 'package:houta_vendor/views/add_offer/widgets/image_uploads.dart';
import 'package:houta_vendor/views/add_offer/widgets/offer_info.dart';

class AddOffers extends StatefulWidget {
  const AddOffers({super.key});

  @override
  State<AddOffers> createState() => _AddOffersState();
}

class _AddOffersState extends State<AddOffers> {
  final PageController _pageController = PageController();
  final TextEditingController title = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController quantity = TextEditingController();
  final TextEditingController types = TextEditingController();
  final TextEditingController tags = TextEditingController();
  final TextEditingController isAvailable = TextEditingController();

  @override
  void dispose() {
    title.dispose();
    description.dispose();
    quantity.dispose();
    price.dispose();
    types.dispose();
    _pageController.dispose();
    isAvailable.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        backgroundColor: kPrimary,
        centerTitle: false,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReusableText(
                text: "Welcome to Vendor Panel",
                style: appStyle(15, kLightWhite, FontWeight.w600)),
            ReusableText(
                text: "Fill all the required infos to add an offer",
                style: appStyle(13, kLightWhite, FontWeight.normal)),
          ],
        ),
      ),
      body: BackGroundContainer(
          child: ListView(
        children: [
          SizedBox(
            width: width,
            height: height,
            child: PageView(
              controller: _pageController,
              pageSnapping: false,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ChooseCategory(
                  next: () {
                    _pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                  },
                ),
                ImageUploads(
                  back: () {
                    _pageController.previousPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                  },
                  next: () {
                    _pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                  },
                ),
                OfferInfo(
                  back: () {
                    _pageController.previousPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                  },
                  next: () {
                    _pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                  },
                  title: title,
                  description: description,
                  price: price,
                  quantity: quantity,
                  types: types,
                  tags:tags,
                  isAvailable: isAvailable,
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
