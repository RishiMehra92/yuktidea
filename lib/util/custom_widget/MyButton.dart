import 'package:flutter/material.dart';
import 'package:yuktidea/util/custom_widget/custom_text.dart';
import 'package:yuktidea/util/globalscolors.dart';


class MyButton extends StatelessWidget {
  final String text;
  final double? size;
  final Color? color;
  final Color? backgroundColor;
  final String? fontFamily;
  final FontWeight? weight;
  final TextAlign? align;
  final VoidCallback onPressed;
  final double borderRadius;
  final bool isColorOpacity;
  final double shadowBlurRadius;

  const MyButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.borderRadius = 100.0,
    this.color,
    this.backgroundColor,
    this.shadowBlurRadius = 10.0,
    this.size,
    this.align,
    this.isColorOpacity=true,
    this.fontFamily,
    this.weight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: [
            BoxShadow(
              color: greyColor,
              offset: const Offset(-4.0, -2.0),
              blurRadius: shadowBlurRadius,
              spreadRadius: 0.0,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: Center(
            child: CustomText(
              text: text,
              color: isColorOpacity?color!.withOpacity(0.4):color,
              size: size,
              fontFamily: fontFamily,
              weight: weight,
            ),
          ),
        ),
      ),
    );
  }
}


