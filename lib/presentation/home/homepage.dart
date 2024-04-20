import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yuktidea/presentation/home/contorller/homeController.dart';
import 'package:yuktidea/util/custom_widget/custom_text.dart';

import '../../util/constant_text.dart';
import '../../util/custom_widget/MyButton.dart';
import '../../util/globalscolors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:SizedBox(
          child: Center(
            child: GetBuilder<HomeController>(
              init: HomeController(),
              builder: (controller) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomText(
                      text: welcome,
                      size: 24,
                      color: Colors.white,
                      weight: FontWeight.w400,
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding:   EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.3,
                        right: MediaQuery.of(context).size.width * 0.3,
                      ),
                      child: MyButton(
                        text: 'Logout',
                        backgroundColor: bgColor,
                        color: termColor,
                        isColorOpacity:false,
                        onPressed: () {
                          controller.logout();
                        },
                      ),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding:   EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.2,
                        right: MediaQuery.of(context).size.width * 0.2,
                      ),
                      child: MyButton(
                        text: 'Delete User',
                        color: termColor,
                        isColorOpacity:false,
                        backgroundColor: bgColor,
                        onPressed: () {
                          controller.deleteAccount();
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        )
    );
  }
}
