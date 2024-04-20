import 'package:flutter/material.dart';
import 'package:yuktidea/util/globalscolors.dart';

class ImageWithShadow extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double borderRadius;
  final double shadowBlurRadius;

  const ImageWithShadow({
    Key? key,
    required this.imageUrl,
    this.height = 100,
    this.borderRadius = 15.0,
    this.shadowBlurRadius = 10.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color:bgColor,
            offset: const Offset(0.0, 0.0),
            blurRadius: shadowBlurRadius,
            spreadRadius: 0.0,
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: [
            BoxShadow(
              color: Colors.white,
              offset: const Offset(0.0, 0.0),
              blurRadius: shadowBlurRadius,
              spreadRadius: 0.0,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: Image.asset(
            imageUrl,
            height: height,
          ),
        ),
      ),
    );
  }
}
