import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:houta_vendor/common/app_style.dart';
import 'package:houta_vendor/common/background_container.dart';
import 'package:houta_vendor/common/custom_appbar.dart';
import 'package:houta_vendor/common/reusable_text.dart';
import 'package:houta_vendor/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:houta_vendor/views/home/Widgets/orders/cancelled.dart';
import 'package:houta_vendor/views/home/Widgets/orders/new_orders.dart';
import 'package:houta_vendor/views/home/Widgets/orders/picked.dart';
import 'package:houta_vendor/views/home/Widgets/orders/preparing.dart';
import 'package:houta_vendor/views/home/Widgets/orders/ready.dart';
import 'package:houta_vendor/views/home/offer/offer_list.dart';
import 'Widgets/home_tabs.dart';
import 'Widgets/home_tiles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabContoller =
      TabController(length: orderList.length, vsync: this);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimary,
        flexibleSpace: CustomAppBar(),
      ),
      body: BackGroundContainer(
          child: OfferList()),
    );
  }
}
