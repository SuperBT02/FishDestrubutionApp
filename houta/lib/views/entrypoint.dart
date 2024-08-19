// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:houta/constants/constants.dart';
import 'package:houta/controllers/tab_index_controller.dart';
// ignore: duplicate_import
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:houta/hooks/fetch_cart.dart';
import 'package:houta/models/cart_response.dart';
import 'package:houta/views/cart/cart_page.dart';
import 'package:houta/views/home/home_page.dart';
import 'package:houta/views/profile/profile_page.dart';
import 'package:houta/views/search/search_page.dart';

class MainScreen extends StatelessWidget {
   MainScreen({super.key});
  List<Widget> pageList = const[
    HomePage(),
    SearchPage(),
    CartPage(),
    ProfilePage(),
    
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TabIndexController());
    return Obx(() => Scaffold(
            body: Stack(
          children: [
            pageList[controller.tabIndex],
            Align(
              alignment: Alignment.bottomCenter,
              child: Theme(
                  data: Theme.of(context).copyWith(canvasColor: kPrimary),
                  child: BottomNavigationBar(
                    showSelectedLabels: false,
                    elevation: 0,
                    showUnselectedLabels: false,
                    unselectedIconTheme:
                        const IconThemeData(color: Colors.black38),
                    selectedIconTheme: const IconThemeData(color: kSecondary),
                    onTap: (value) {
                      controller.setTabIndex = value;
                    },
                    currentIndex: controller.tabIndex,
                    items: [
                      BottomNavigationBarItem(
                          icon: controller.tabIndex == 0
                              ? const Icon(AntDesign.appstore1)
                              : const Icon(AntDesign.appstore_o),
                          label: 'Home'),
                      const BottomNavigationBarItem(
                          icon: Icon(Icons.search), label: 'Search'),
                      const BottomNavigationBarItem(
                          icon: Badge(
                              label: Text('5'),
                              child: Icon(FontAwesome.opencart)),
                          label: 'Cart'),
                      BottomNavigationBarItem(
                          icon:controller.tabIndex ==3
                           ?const Icon(FontAwesome.user_circle)
                           :const Icon(FontAwesome.user_circle_o),
                            label: 'Profile'),
                    ],
                  )),
            )
          ],
        )));
  }
}
