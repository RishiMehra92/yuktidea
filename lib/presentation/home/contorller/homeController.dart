import 'dart:convert';

import 'package:get/get.dart';

import '../../../controllers/base_controller.dart';
import '../../../services/remote_services.dart';
import '../../../util/constant_text.dart';
import '../../../util/utils.dart';
import '../../onbording/models/LogoutDeleteResponse.dart';
import '../../onbording/view/select_options_screen.dart';

class HomeController extends GetxController with BaseController {
  LogoutDeleteResponse? logoutDeleteResponse;

  void logout() async {
    showLoading(loading);
    var request = {};
    var response = await RemoteServices()
        .post(baseUrl, 'logout', request)
        .catchError((error) {
      handleError(error);
      hideLoading();
    });

    if (response == null) return;
     var responseJson = jsonDecode(response); // Assuming response is a JSON string
    logoutDeleteResponse = LogoutDeleteResponse.fromJson(responseJson);
    storage.write("token", "");
    hideLoading();
    Get.offAll(() => SelectOptionsScreen());
    update();
  }

  void deleteAccount() async {
    showLoading(loading);
    var request = {};
    var response = await RemoteServices()
        .post(baseUrl, 'delete', request)
        .catchError((error) {
      handleError(error);
      hideLoading();
    });
    if (response == null) return;
    hideLoading();
    var responseJson =
        jsonDecode(response); // Assuming response is a JSON string
    logoutDeleteResponse = LogoutDeleteResponse.fromJson(responseJson);
    storage.write("token", "");
    Get.offAll(() => SelectOptionsScreen());
    update();
  }
}
