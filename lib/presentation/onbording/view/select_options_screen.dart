import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yuktidea/presentation/terms/view/TermsView.dart';
import 'package:yuktidea/util/globalscolors.dart';

import '../../../util/custom_widget/custom_text.dart';
import '../../../util/imageurl.dart';
import 'ImageWithShadow.dart';
import '../controllers/select_options_controller.dart';

class SelectOptionsScreen extends StatelessWidget {
  final selectOptionController = Get.put(SelectOptionsController());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
            Expanded(
              flex: 3,
              child:Container(
                color: Colors.white,
                child: Image.asset("assets/ic_main_img.gif",
                  fit: BoxFit.scaleDown,

                ),
              )
          ),
          Container(
            padding: EdgeInsets.only(bottom:MediaQuery.of(context).size.height * 0.04 ),
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.6),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.5),
                  spreadRadius: 0,
                  blurRadius: 10,
                  offset: Offset(0, -3), // Shadow on top edge
                ),
              ],
            ),
            child:   Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const CustomText(
                  text: "Welcome to Study Lancer",
                  weight: FontWeight.w600,
                  size: 24,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 10,
                ),
                const CustomText(
                  text: "Please select your role to get registered",
                  weight: FontWeight.w600,
                  size: 14,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 20,
                ),
                  Row(
                  children: [
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap:(){
                            Get.toNamed("countryList",arguments: {'loginType': 'Student'});
                          },
                          child: const Column(
                          children: [
                            // Add your widgets here
                            ImageWithShadow(
                              imageUrl: "assets/img2.png",
                              height: 100,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CustomText(
                              text: "Student",
                              weight: FontWeight.w600,
                              size: 14,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                      Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap:(){
                          Get.toNamed("countryList",arguments: {'loginType': 'Agent'});
                        },
                        child: const Column(
                          children: [
                            // Add your widgets here
                            ImageWithShadow(
                              imageUrl: "assets/img1.png",
                              height: 100,
                            ),

                            SizedBox(
                              height: 10,
                            ),
                            CustomText(
                              text: "Agent",
                              weight: FontWeight.w600,
                              color: Colors.white,
                              size: 14,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: (){
                    Get.to(() => TermsPage());
                    },
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 12.0,
                        fontFamily:"Metropolis" ,
                        color:Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                      children: <TextSpan>[
                        TextSpan(text: 'By continuing you agree to our '),
                        TextSpan(
                          text: 'Terms and Conditions',
                          style: TextStyle(
                            fontSize: 12.0,
                            fontFamily:"Metropolis",
                            color: termColor, // Change color to your desired color
                            fontWeight: FontWeight.w400,
                          ),
                          // Add a gesture recognizer if you want to make the text tappable
                          // recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                      ],
                    ),
                  ),
                )

              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CurvedContainerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 50);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
