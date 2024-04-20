import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 import '../presentation/onbording/view/select_options_screen.dart';
import '../util/custom_widget/custom_text.dart';
import '../util/globalscolors.dart';
import '../util/utils.dart';
import 'Palette.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';



class DialogHelper {
  //show error dialog
  static void showErroDialog({String title = 'Error', String? description}) {
    GetPlatform.isIOS
        ? Get.dialog(
            CupertinoAlertDialog(
              title: Text(title),
              content: Text(description!),
              actions: [
                CupertinoDialogAction(
                    onPressed: () {
                      // if (Get.isDialogOpen!) {
                      //   Get.back();
                      //   hideLoading();
                      //   storage.write("token", "");
                      //   Get.offAll(() => LoginScreen());
                      //
                      // }
                    },
                    isDefaultAction: true,
                    child: const Text("Okay"))
              ],
            ),
          )
        : Get.dialog(Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)), //this right here
            child: SizedBox(

             height: 175,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      description!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: .1,
                      width: double.infinity,
                      color: Colors.black,
                    ),
                    Flexible(
                      child: Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  textStyle: const TextStyle(fontSize: 16),
                                ),
                                onPressed: () {
                                  if (Get.isDialogOpen!) {
                                    Get.back();
                                    hideLoading();
                                  }
                                },
                                child: const Text("Okay",
                                    style: TextStyle(
                                      color: darkBlue,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ));
  }

//show error dialog
  static void showUnAuthenticatedDialog(
      {String title = 'Error', String? description = 'Something went wrong'}) {
    hideLoading();
    storage.erase();
    // try {
    //   Get.offAll(() => LoginScreen());
    // } catch (ex) {
    //   Get.offAll(() => LoginScreen());
    // }

    // Get.snackbar('Alert',
    //     'You are logged out automatically, because you are logged in on another device',
    //     colorText: Colors.red, snackPosition: SnackPosition.TOP);
  }

  //show toast
  //show snack bar
  //show loading
  static void showLoading([String? message]) async {
    Get.dialog(
      const Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  //hide loading
  static void hideLoading() {

    if (Get.isDialogOpen!) {
      Get.back();
    }
  }

  static void showErrorAPIDialog() {
    Get.bottomSheet(
      Container(
        height: 300,
        padding: const EdgeInsets.only(left: 39, right: 39),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 70,
                width: 72,
                child: SvgPicture.asset('assets/ic_cross.svg'),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomText(
                text: 'Afmelden niet mogelijk',
                size: 27,
                fontFamily: "Metropolis",
                weight: FontWeight.bold,
                color: Color(0xffB57373),
              ),
              const SizedBox(
                height: 17,
              ),
              CustomText(
                text: 'Deze uitvaartkist is al gebruikt.',
                size: 16,
                align: TextAlign.center,
                fontFamily:"Metropolis",
                color: Color(0xffADACAE),
              ),
              const SizedBox(
                height: 17,
              ),
              Container(
                width: 176,
                height: 54,
                child: ElevatedButton(
                  onPressed: () {
                    Get.back();
                    Get.offAll(() => SelectOptionsScreen());
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xffB57373),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(10),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 7, 0, 7),
                      child: Text(
                        "Terug",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily:
                          "Metropolis",
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    // showModalBottomSheet<void>(
    //   context: context,
    //   shape: const RoundedRectangleBorder(
    //     // <-- SEE HERE
    //     borderRadius: BorderRadius.vertical(
    //       top: Radius.circular(25.0),
    //     ),
    //   ),
    //   isDismissible: false,
    //   isScrollControlled: false,
    //   enableDrag: false,
    //   builder: (BuildContext context) {
    //     return Container(
    //       height: 300,
    //       padding: EdgeInsets.only(left: 39, right: 39),
    //       decoration: const BoxDecoration(
    //         color: Colors.white,
    //         borderRadius: BorderRadius.vertical(
    //           top: Radius.circular(25.0),
    //         ),
    //       ),
    //       child: Center(
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           children: <Widget>[
    //             const SizedBox(
    //               height: 30,
    //             ),
    //             SizedBox(
    //               height: 70,
    //               width: 72,
    //               child: SvgPicture.asset('assets/ic_cross.svg'),
    //             ),
    //             const SizedBox(
    //               height: 10,
    //             ),
    //             CustomText(
    //               text: 'Afmelden niet mogelijk',
    //               size: 27,
    //               fontFamily:"Metropolis,
    //               weight: FontWeight.bold,
    //               color: Color(0xffB57373),
    //             ),
    //             const SizedBox(
    //               height: 17,
    //             ),
    //             CustomText(
    //               text: 'Deze uitvaartkist is al gebruikt.',
    //               size: 16,
    //               align: TextAlign.center,
    //               fontFamily:"Metropolis,
    //               color: Color(0xffADACAE),
    //             ),
    //             const SizedBox(
    //               height: 17,
    //             ),
    //             Container(
    //               width: 176,
    //               height: 54,
    //               child: ElevatedButton(
    //                 onPressed: () {
    //                   Navigator.pop(context);
    //                   Get.offAll(() => SelectOptionsScreen());
    //                 },
    //                 style: ElevatedButton.styleFrom(
    //                     primary: Color(0xffB57373),
    //                     //background color of button
    //                     //elevation of button
    //                     shape: RoundedRectangleBorder(
    //                         borderRadius: BorderRadius.circular(10)),
    //                     padding: const EdgeInsets.all(
    //                         10) //content padding inside button
    //                     ),
    //                 child: Center(
    //                   child: Padding(
    //                     padding: const EdgeInsets.fromLTRB(0, 7, 0, 7),
    //                     child: Text(
    //                       "Terug",
    //                       style: TextStyle(
    //                           fontSize: 20,
    //                           fontWeight: FontWeight.bold,
    //                           fontFamily: Theme.of(context)
    //                               .textTheme
    //                               .headline1
    //                               ?.fontFamily,
    //                           color: Colors.white),
    //                       textAlign: TextAlign.center,
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     );
    //   },
    // );


  }
}
