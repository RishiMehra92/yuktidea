import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yuktidea/util/globalscolors.dart';

import '../../../util/constant_text.dart';
import '../../../util/custom_widget/FlaggedInputField.dart';
import '../../../util/custom_widget/MyButton.dart';
import '../../../util/custom_widget/custom_text.dart';
import '../controllers/auth_controller.dart';

class GetPhoneNumber extends StatelessWidget {
  const GetPhoneNumber({super.key});

  @override
  Widget build(BuildContext context) {
    final Map arguments = Get.arguments;
    final countyCode = arguments['countyCode'];
    final flagImage = arguments['flagImage'];
    final loginType = arguments['loginType'];


    return Scaffold(
      body: GetBuilder<AuthController>(
        init: Get.find<AuthController>()..getCountrylist(),
        builder: (authController) => Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: SizedBox(
                      width: 60,
                      height: 60,
                      child: Image.asset("assets/ic_bck.png")),
                ),
                const Center(
                  child: CustomText(
                    text: enterphone,
                    weight: FontWeight.w400,
                    color: Colors.white,
                    size: 24,
                    align: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Center(
                  child: CustomText(
                    text: enterphone10digit,
                    weight: FontWeight.w400,
                    color: termColor,
                    size: 14,
                    align: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Image.asset("assets/ic_divider.png"),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.1,
                    right: MediaQuery.of(context).size.width * 0.1,
                  ),
                  child: Center(
                    child: FlaggedInputField(
                      hintText: "9999999999",
                      flagIcon: flagImage,
                      countrycode: countyCode,
                      controller: authController.phoneTextEditingController,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
            Positioned(
              bottom: 100,
              right: MediaQuery.of(context).size.width * 0.25,
              left: MediaQuery.of(context).size.width * 0.25,
              child: MyButton(
                text: 'Get OTP',
                color: btnColor,
                size: 18,
                weight: FontWeight.w400,
                onPressed: () {
                  if (loginType == "Agent") {
                    authController.counsellorLogin(countyCode, loginType, true,flagImage);
                  } else {
                    authController.studentLogin(countyCode, loginType, true,flagImage);
                  }

                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
