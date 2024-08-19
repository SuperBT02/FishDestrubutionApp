import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:houta/common/app_style.dart';
import 'package:houta/common/reusable_text.dart';
import 'package:houta/constants/constants.dart';

class Heading extends StatelessWidget {
  const Heading({super.key, required this.text, this.onTap, this.more});
  final String text;
  final void Function()? onTap;
  final bool? more;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ReusableText(
                  text: text, style: appStyle(16, kDark, FontWeight.bold)),
            ),
            more == null
                ? GestureDetector(
                    onTap: onTap,
                    child: const Icon(
                      AntDesign.appstore1,
                      color: kSecondary,
                      size: 20,
                    ),
                  )
                : const SizedBox.shrink()
          ],
        ));
  }
}
