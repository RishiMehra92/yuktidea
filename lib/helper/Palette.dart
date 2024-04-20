import 'package:flutter/material.dart';
class Palette {
  static const MaterialColor kToDark = MaterialColor(
    0xff212426, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50:   Color(0xff212426),//10%
      100:   Color(0xff212426),//20%
      200:   Color(0xff212426),//30%
      300:   Color(0xff212426),//40%
      400:   Color(0xff212426),//50%
      500:   Color(0xff212426),//60%
      600:   Color(0xff212426),//70%
      700:   Color(0xff212426),//80%
      800:   Color(0xff212426),//90%
      900:   Color(0xff212426),//100%
    },
  );
} // y