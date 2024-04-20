import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:yuktidea/util/globalscolors.dart';
import 'package:flutter_svg/svg.dart';
import '../../../util/constant_text.dart';
import '../../../util/custom_widget/custom_text.dart';
import '../../../util/utils.dart';
import '../controller/terms_controller.dart';

class TermsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<TermsController>(
            init: TermsController(),
            builder: (termsController) {
              if (termsController.termsModel != null) {
                return Column(
                  children: [
                    Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: SizedBox(
                              width: 60,
                              height: 60,
                              child: Image.asset("assets/ic_cut.png"))),
                    ),
                    Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16.0,right: 16),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    child: SvgPicture.asset('assets/terms.svg'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16.0,top: 8),
                                    child: Column(children: [
                                      const CustomText(text:termService,
                                        weight: FontWeight.w500,
                                        size: 18,
                                        color: termColor,
                                      ),
                                      const SizedBox(height: 6,),
                                        CustomText(text:"Update ${convertDateFormat(termsController.termsModel!.data!.updatedAt!)}",
                                        weight: FontWeight.w400,
                                        size: 14,
                                        color: greyColor,
                                      ),

                                    ],),
                                  )
                                ],),
                              const SizedBox(height: 20,),

                                Html(
                                  data: termsController.termsModel!.data!.content,
                                  style: {
                                    'h1': Style(
                                      color: termColor, // Set the color for <h1> elements
                                      fontWeight: FontWeight.w500, // Set the font weight for <h1> elements
                                      fontSize: FontSize(14), // Set the font size for <h1> elements
                                    ),
                                    'p': Style(
                                      color: Colors.white, // Set the color for <h1> elements
                                      fontWeight: FontWeight.w400, // Set the font weight for <h1> elements
                                      fontSize: FontSize(12), // Set the font size for <h1> elements
                                    ),
                                    'li': Style(
                                      color: Colors.white, // Set the color for <h1> elements
                                      fontWeight: FontWeight.w400, // Set the font weight for <h1> elements
                                      fontSize: FontSize(12), // Set the font size for <h1> elements
                                    ),
                                    // Set the color for <h1> elements
                                  },
                                ),
                              ],
                            ),
                          ),
                        )),
                  ],
                );
              } else {
                return const Center(child: CircularProgressIndicator(
                  color: Colors.white,
                ));
              }
            }));
  }
}

