import 'package:flutter/material.dart';
import 'package:houta/constants/constants.dart';


class BackGroundContainer extends StatelessWidget {
  const BackGroundContainer({super.key, required this.child, required this.color});
  final Widget child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              ),

              
              ),
              child: child,
    );
  }
}
