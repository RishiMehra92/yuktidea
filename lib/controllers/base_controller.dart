
import 'package:flutter/material.dart';
import 'package:yuktidea/util/globalscolors.dart';

import '../helper/dialog_helper.dart';
import '../services/app_exceptions.dart';
import 'package:get/get.dart';


mixin BaseController {
  void handleError(error) {
    hideLoading();
    if (error is BadRequestException) {
      var message = error.message;
      DialogHelper.showErroDialog(description: message);
    } else if (error is FetchDataException) {
      var message = error.message;
      DialogHelper.showErroDialog(description: message);
    } else if (error is ApiNotRespondingException) {
      DialogHelper.showErroDialog(
          description: 'Oops! It took longer to respond.');
    }
  }

  showLoading([String? message]) {
    DialogHelper.showLoading(message);
  }

  hideLoading() {
    DialogHelper.hideLoading();
  }

  showSnackbar(String title,String subtitle){
    Get.snackbar(
      title, // Title
     subtitle, // Message
      snackPosition: SnackPosition.TOP, // Position of the snackbar
      duration: const Duration(seconds: 3), // Duration for which the snackbar is displayed
      backgroundColor:bgColor, // Background color of the snackbar
      colorText: Colors.white, // Text color of the snackbar
      borderRadius: 10.0, // Border radius of the snackbar
      margin: const EdgeInsets.all(10.0), // Margin around the snackbar
      padding: const EdgeInsets.all(10.0), // Padding inside the snackbar
      barBlur: 20.0, // Blur value for the snackbar
      isDismissible: true, // Whether the snackbar can be dismissed by tapping outside
      forwardAnimationCurve: Curves.easeOutBack, // Animation curve for showing the snackbar
      reverseAnimationCurve: Curves.easeInBack, // Animation curve for hiding the snackbar
    );

  }

}
