import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../util/constant_text.dart';
import '../../../util/custom_widget/MyButton.dart';
import '../../../util/custom_widget/custom_text.dart';
import '../../../util/globalscolors.dart';
import '../controllers/auth_controller.dart';

class VerifyPhoneNumber extends StatefulWidget {
  VerifyPhoneNumber({Key? key}) : super(key: key);

  @override
  VerifyPhoneNumberState createState() => VerifyPhoneNumberState();
}

class VerifyPhoneNumberState extends State<VerifyPhoneNumber> {
  StreamController<ErrorAnimationType> errorController =
      StreamController<ErrorAnimationType>();
  late Timer timer;
  int start = 10; // Timer duration in seconds


  @override
  void initState() {
    super.initState();

    startTimer();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(oneSec, (Timer timer) {
      if (start == 0) {
        setState(() {
          timer.cancel();
        });
      } else {
        setState(() {
          start--;
        });
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: GetBuilder<AuthController>(
        init: AuthController(),
        builder: (authController) => Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    //  Get.back();
                    Get.toNamed("getPhoneNumber");
                  },
                  child: SizedBox(
                    width: 60,
                    height: 60,
                    child: Image.asset("assets/ic_bck.png"),
                  ),
                ),
                const Center(
                  child: CustomText(
                    text: verifyNumber,
                    weight: FontWeight.w400,
                    color: Colors.white,
                    size: 24,
                    align: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                const Center(
                  child: CustomText(
                    text: verifyotp,
                    weight: FontWeight.w400,
                    color: termColor,
                    size: 14,
                    align: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                Image.asset("assets/ic_divider.png"),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: PinCodeTextField(
                    length: 4,
                    obscureText: false,
                    cursorColor: Colors.white,
                    animationType: AnimationType.fade,
                    textStyle: const TextStyle(
                      fontFamily: "Metropolis",
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 60,
                      fieldWidth: 50,
                      activeFillColor: Colors.transparent,
                      activeColor: Colors.white,
                      selectedColor: Colors.white,
                      inactiveColor: Colors.white,
                      inactiveFillColor: Colors.transparent,
                    ),
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    errorAnimationController: errorController,
                    controller: authController.pintextEditingController,
                    onCompleted: (v) {
                      print("Completed");
                    },
                    onChanged: (value) {
                      print(value);
                    },
                    beforeTextPaste: (text) {
                      print("Allowing to paste $text");
                      return true;
                    },
                    appContext: context,
                  ),
                ),
                const SizedBox(height: 60),
                const Center(
                  child: CustomText(
                    text: didntotp,
                    weight: FontWeight.w400,
                    color: greyColor,
                    size: 14,
                    align: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      if (start == 0) {
                        startTimer();
                        // Handle resend OTP logic here...
                      }
                    },
                    child: start == 0
                        ? GestureDetector(
                            onTap: () {
                              if (authController.loginType == "Agent") {
                                authController.counsellorLogin(false);
                              } else {
                                authController.studentLogin(
                                     false);
                              }
                              startTimer();
                            },
                            child: const CustomText(
                              text: "Resend OTP",
                              weight: FontWeight.w400,
                              color: termColor,
                              size: 18,
                              align: TextAlign.center,
                            ),
                          )
                        : RichText(
                            text: TextSpan(
                              style: const TextStyle(
                                fontSize: 12.0,
                                fontFamily: "Metropolis",
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                              children: <TextSpan>[
                                const TextSpan(
                                  text: 'Resend OTP in ',
                                ),
                                TextSpan(
                                  text: '$start seconds',
                                  style: const TextStyle(
                                    color: termColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 100,
              right: MediaQuery.of(context).size.width * 0.25,
              left: MediaQuery.of(context).size.width * 0.25,
              child: MyButton(
                text: 'Verify',
                color: btnColor,
                onPressed: () {
                  authController.verifyOtp("${authController.countryCode}${authController.phoneTextEditingController.text.toString()}");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
