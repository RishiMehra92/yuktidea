import 'package:flutter/material.dart';

class MultiColorText extends StatelessWidget {
  final List<TextSpan>? textSpans;
  final double? size;
  final Color? color;
  final String? fontFamily;
  final FontWeight? weight;
  final TextAlign? align;
  final double? height;
  final int? maxLines;
  final TextDecoration? decoration;

  const MultiColorText({
    Key? key,
    this.textSpans,
    this.size,
    this.color,
    this.weight,
    this.fontFamily,
    this.align,
    this.maxLines,
    this.decoration,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: textSpans,
        style: TextStyle(
          fontSize: size ?? 16,
          color: color ?? Colors.black,
          fontWeight: weight ?? FontWeight.normal,
          fontFamily: fontFamily ?? Theme.of(context).textTheme.headline1!.fontFamily,
          decoration: decoration,
          height: height,
        ),
      ),
      textAlign: align,
      maxLines: maxLines,
    );
  }
}
