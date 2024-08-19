import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:houta_vendor/common/app_style.dart';
import 'package:houta_vendor/common/reusable_text.dart';
import 'package:houta_vendor/constants/constants.dart';

class ProfilTileWidget extends StatelessWidget {
  const ProfilTileWidget(
      {super.key, required this.title, required this.icon, this.onTap});

  final String title;
  final IconData icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minLeadingWidth: 0,
      visualDensity: VisualDensity.compact,
      onTap: onTap,
      leading: Icon(icon),
      title: ReusableText(
          text: title, style: appStyle(11, kGray, FontWeight.normal)),
      trailing:  const Icon(AntDesign.right)
    );
  }
}
