import 'package:flutter/material.dart';

const green = Color.fromARGB(255, 0, 206, 132);
const greenTransparent = Color.fromARGB(25, 255, 255, 255);
const greenDarkTransparent = Color.fromARGB(31, 2, 58, 24);
const darkBlue = Color.fromARGB(255, 27, 20, 100);
const black = Color.fromARGB(255, 17, 17, 17);
const lightTextBlue = Color.fromARGB(255, 128, 123, 174);
const inputFieldBackgroundColor = Color.fromARGB(255, 241, 240, 250);
const lightPurple = Color.fromARGB(255, 108, 92, 231);
const unFocussedColor = Color.fromARGB(255, 188, 182, 230);
const unFocussedColor1 = Color.fromARGB(255, 128, 123, 174);
const unFocussedColor3 = Color.fromARGB(255, 248, 248, 248);

const inputFieldBackgroundColorBorder = Color.fromARGB(255, 231, 229, 244);
const red = Color.fromARGB(255, 237,59, 59);
const redTransparent = Color.fromARGB(25, 255, 255, 255);
const yellow = Color.fromARGB(255, 255, 191, 71);
const lightColor = Color(0xff807BAE);
const bgColor=Color(0xff212426);
const termColor=Color(0xffD9896A);
const greyColor=Color(0xff7D7E80);
const hintColor=Color(0xff656366);
const btnColor=Color(0xF9D3B466);
const inputbg=Color(0xF94B4E4F);

const darkGreenColor=Color(0xff212426);
const yellowTransparent =Color.fromARGB(25, 255, 255, 255);
const borderRadiusTheme = 12.0;




final darkButton = ElevatedButton.styleFrom(
    primary: darkGreenColor,
    //background color of button
    //elevation of button
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)),
    padding: const EdgeInsets.all(
        10) //content padding inside button
);

final lightButton = ElevatedButton.styleFrom(
    primary: const Color.fromARGB(255, 108, 92, 231),
    //background color of button
    //elevation of button
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadiusTheme)),
    padding: const EdgeInsets.all(
        10) //content padding inside button
);

final whiteButton = ElevatedButton.styleFrom(
    primary: Colors.white,
    //background color of button
    //elevation of button
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadiusTheme)),
    padding: const EdgeInsets.all(
        10) //content padding inside button
);

final greenButton = ElevatedButton.styleFrom(
    primary: const Color.fromARGB(255, 0, 206, 132),
    //background color of button
    //elevation of button
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadiusTheme)),
    padding: const EdgeInsets.all(
        10) //content padding inside button
);


class SelectedEventSingleton {
  static final SelectedEventSingleton _instance = SelectedEventSingleton._internal();

  factory SelectedEventSingleton() => _instance;

  Map? selectedEvent;

  SelectedEventSingleton._internal();
}

