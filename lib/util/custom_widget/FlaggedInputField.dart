import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yuktidea/util/custom_widget/custom_text.dart';
import 'package:yuktidea/util/globalscolors.dart';


class FlaggedInputField extends StatelessWidget {
  final String hintText;
  final String flagIcon;
  final String countrycode;
  final TextEditingController controller;

  const FlaggedInputField({
    Key? key,
    required this.hintText,
    required this.flagIcon,
    required this.countrycode,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.only(
                left: MediaQuery.of(context).size.width*0.065
            ),
            child: Padding(
              padding: const EdgeInsets.only(top:6.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 25,
                    width: 45,
                    child: SvgPicture.network(flagIcon),
                  ),
                  const SizedBox(width: 8.0), // Add spacing between flag and country code
                  Padding(
                    padding: const EdgeInsets.only(top:6.0),
                    child: CustomText(
                      text: countrycode,
                      size: 18,
                      weight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 8.0), // Add spacing between country code and text field
                  Expanded(
                    child: TextField(
                      controller: controller,
                      cursorColor: Colors.white,
                      maxLength: 10,
                      maxLines: 1,
                      keyboardType: TextInputType.number, // Set the keyboard type to only accept numbers
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(16)
                      ], // Allow only digits
                      decoration:   InputDecoration(
                        hintText: hintText,
                        counterText: "",
                        hintStyle: const TextStyle(
                          fontFamily: "Metropolis",
                          fontSize: 18,
                          color: hintColor,
                          fontWeight: FontWeight.w500,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                      ),
                      style: const TextStyle(
                        fontFamily: "Metropolis",
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            height: 1.0,
            color: Colors.grey, // Add your desired color here
          ),
        ],
      ),

    );




  }
}
