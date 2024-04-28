import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:yuktidea/presentation/onbording/controllers/auth_controller.dart';
import 'package:yuktidea/util/custom_widget/custom_text.dart';
import 'package:yuktidea/util/globalscolors.dart';

import '../../../util/constant_text.dart';
import '../../../util/progressbar.dart';

class CountryListPage extends StatefulWidget {
  @override
  _CountryListPageState createState() => _CountryListPageState();
}


class _CountryListPageState extends State<CountryListPage> {

  var loginType="Agent";
  @override
  void initState() {
    super.initState();
     }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: GetBuilder<AuthController>(
        init: AuthController(),
        builder: (controller) {
          if (controller.countryModel != null) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: SizedBox(
                        width: 60,
                        height: 60,
                        child: Image.asset("assets/ic_bck.png"))),
                const Center(
                  child: CustomText(
                    text: selctCountry,
                    weight: FontWeight.w400,
                    color: Colors.white,
                    size: 24,
                    align: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.1,
                    right: MediaQuery.of(context).size.width * 0.1,
                  ),
                  child: Card(
                    elevation: 2, // Add elevation for a shadow effect
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: inputbg,
                        // Set the background color of the TextField
                        borderRadius: BorderRadius.circular(
                            8.0), // Optional: Set border radius
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Center(
                        child: TextField(
                          controller:controller.searchController,
                          cursorColor: Colors.white,
                          onChanged: (value) {
                            value = value.toLowerCase();
                            setState(() {
                              controller.filteredCountries = controller
                                  .countryModel!.data!
                                  .where((element) =>
                                      element.name!
                                          .toLowerCase()
                                          .contains(value) ||
                                      element.code!
                                          .toLowerCase()
                                          .contains(value))
                                  .toList();
                            });
                          },
                          style: const TextStyle(
                            fontFamily: "Metropolis",
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                          decoration: const InputDecoration(
                            //   labelText: 'Search',
                            hintText: "Search",
                            hintStyle: TextStyle(
                              fontFamily: "Metropolis",
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                            border: InputBorder.none, // Remove the border
                            prefixIcon: Icon(Icons.search, color: termColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Image.asset("assets/ic_divider.png"),
                const SizedBox(
                  height: 20,
                ),
                controller.filteredCountries.isEmpty
                    ? const Center(
                        child: CustomText(
                          text: noCountry,
                          weight: FontWeight.w400,
                          color: Colors.white,
                          size: 24,
                          align: TextAlign.center,
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                          itemCount: controller.filteredCountries.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                controller.searchController.clear();
                                controller.flgImage=controller.filteredCountries[index].flag!;
                                controller.countryCode=controller.filteredCountries[index].telCode!;
                                controller.loginType=loginType;
                                Get.toNamed("getPhoneNumber");
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                color: Colors.transparent,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16.0, right: 16.0),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                                height: 22,
                                                width: 32,
                                                child: SvgPicture.network(
                                                    controller
                                                        .filteredCountries[index]
                                                        .flag!)),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: CustomText(
                                                text: controller
                                                    .filteredCountries[index]
                                                    .name,
                                                color: Colors.white,
                                                maxLine: 1,
                                                size: 18,
                                                weight: FontWeight.w500,
                                              ),
                                            ),
                                            const Spacer(),
                                            CustomText(
                                              text: controller
                                                  .filteredCountries[index]
                                                  .telCode,
                                              color: Colors.white,
                                              size: 18,
                                              weight: FontWeight.w500,
                                            )
                                          ],
                                        ),
                                      ),
                                      Image.asset("assets/ic_divider.png")
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
              ],
            );
          } else {
            return Progressbar();
          }
        },
      ),
    );
  }
}
