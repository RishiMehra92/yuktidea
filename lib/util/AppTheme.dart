import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helper/Palette.dart';
import 'globalscolors.dart';

class AppTheme {
  static final ThemeData themeData = ThemeData(
    cupertinoOverrideTheme: const CupertinoThemeData(
      primaryColor: Colors.black,
    ),
    scaffoldBackgroundColor: darkGreenColor,
    fontFamily: 'Metropolis',
    primarySwatch: Palette.kToDark,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: darkGreenColor,
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.w700,
        color: black,
      ),
      headline2: TextStyle(
        fontSize: 17.0,
        fontWeight: FontWeight.bold,
        color: black,
      ),
      bodyText1: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w100,
        color: black,
      ),
      bodyText2: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w100,
        color: black,
      ),
    ),
  );
}