import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:yuktidea/util/custom_widget/custom_text.dart';
import 'package:yuktidea/util/globalscolors.dart';
import '../../../util/constant_text.dart';
import '../../../util/custom_widget/MyButton.dart';
import '../controllers/auth_controller.dart';

class SelectCountry extends StatefulWidget {
  const SelectCountry({super.key});

  @override
  State<SelectCountry> createState() => _SelectCountryState();
}

class _SelectCountryState extends State<SelectCountry> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    // final Map arguments = Get.arguments;
    // final countyCode = arguments['countyCode'];
    // final flagImage = arguments['flagImage'];
    // final loginType = arguments['loginType'];

    return Scaffold(
        body: SizedBox(
            child: GetBuilder<AuthController>(
                init: Get.find<AuthController>()..selectCountry(),
                builder: (controller) {
                  if (controller.selectCountryResponse != null) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                           Get.back();
                            // Get.toNamed("verifyPhoneNumber", arguments: {
                            //   'countyCode': '${countyCode.trim()}',
                            //   'phone': controller.phoneTextEditingController.text.trim(),
                            //   'loginType': loginType,
                            //   'flagImage':flagImage
                            // });
                          },
                          child: SizedBox(
                              width: 60,
                              height: 60,
                              child: Image.asset("assets/ic_bck.png"))
                        ),
                        const   Center(
                          child:   CustomText(
                            text: Selectcnty,
                            color: Colors.white,
                            size: 24,
                            weight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const   Center(
                          child:  CustomText(
                            text: SelectcntyStudy,
                            color: btnColor,
                            size: 14,
                            align: TextAlign.center,
                            weight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Image.asset("assets/ic_divider.png"),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height:  MediaQuery.of(context).size.height * 0.5,
                         // padding: EdgeInsets.only(left: 40,right: 40),
                          alignment: Alignment.topRight,
                          child: GridView.builder(
                            gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount:controller.selectCountryResponse!.data!.countries!.length>2? 3:2, // Number of columns
                              crossAxisSpacing: MediaQuery.of(context).size.height * 0.06, // Space between each column
                              mainAxisSpacing: MediaQuery.of(context).size.height * 0.06, // Space between each row
                            ),
                            itemCount: controller
                                .selectCountryResponse!.data!.countries!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                  controller.selectedCountryId.value=controller.selectCountryResponse!.data!.countries![index].id.toString();
                                  // Handle item click here
                                  print('Item clicked: ${controller.selectCountryResponse!.data!.countries![index].flag}');
                                },
                                child: GridTile(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: MediaQuery.of(context).size.height * 0.1, // Set the height to 100
                                        width: MediaQuery.of(context).size.height * 0.1, // Set the width to 200
                                       // padding: const EdgeInsets.all(10.0),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10.0), // Set the border radius for rounded corners
                                          child: SvgPicture.network(
                                            controller.selectCountryResponse!.data!.countries![index].flag!,
                                            fit: BoxFit.cover, // Set the fit property to cover or any other fit option you need
                                          ),
                                        )
                                      ),
                                      const SizedBox(height: 5.0),
                                      CustomText(text:controller.selectCountryResponse!.data!.countries![index].name!,
                                        weight: FontWeight.w400,
                                        size: 18,
                                        color: selectedIndex == index ? Colors.white : greyColor,

                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding:   EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.3,
                            right: MediaQuery.of(context).size.width * 0.3,
                          ),
                          child: Center(
                            child: MyButton(
                              text: proceed,
                              weight: FontWeight.w400,
                              size: 18,
                              color: btnColor,
                              onPressed: () {
                                controller.postCountry();
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const   Center(
                          child:  CustomText(
                            text: countryinterest,
                            color: Colors.white,
                            size: 12,
                            weight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const  Center(
                          child:   CustomText(
                            text: consult,
                            color: btnColor,
                            size: 18,
                            weight: FontWeight.w500,
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                })));
  }
}
