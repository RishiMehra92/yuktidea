import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final double? size;
  final Color? color;
  final String? fontFamily;
  final FontWeight? weight;
  final TextAlign? align;
  final double? height;
  final int? maxLine;
  final TextDecoration? decoration;

  const CustomText(
      {Key? key,
      this.text,
      this.size,
      this.color,
      this.weight,
      this.fontFamily,
      this.align,
        this.maxLine,
      this.decoration,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      textAlign: align,
      maxLines: maxLine,
      style: TextStyle(
          fontSize: size ?? 16,
          color: color ?? Colors.black,
          fontWeight: weight ?? FontWeight.normal,
          fontFamily: Theme.of(context).textTheme.headline1!.fontFamily,
          decoration: decoration,
          height: height),
    );
  }
}
