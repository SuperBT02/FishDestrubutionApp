import 'package:flutter/material.dart';
import 'package:houta/constants/constants.dart';

// ignore: must_be_immutable
class CustomContainer extends StatelessWidget {
   CustomContainer({super.key, required this.ContainerContent, this.color});

  Widget ContainerContent;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.75,
      child: ClipRRect(borderRadius:  const BorderRadius.only(
        bottomLeft: Radius.circular(30.0),
        bottomRight: Radius.circular(30.0),
      ),
      child: Container(
        width: width,
        color:  color??kOffWhite,
        child: SingleChildScrollView(
          child: ContainerContent,
        ),
      ),)
    );
  }
}