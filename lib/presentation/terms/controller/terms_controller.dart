
import 'dart:convert';

import 'package:get/get.dart';

import '../../../controllers/base_controller.dart';
import '../../../helper/dialog_helper.dart';
import '../../../services/app_exceptions.dart';
import '../../../services/remote_services.dart';
import '../../../util/utils.dart';
import '../model/TermsModel.dart';

class TermsController extends GetxController with BaseController {
  TermsModel? termsModel;

  @override
  void onInit() {
    getTerms();
    super.onInit();
  }

  void getTerms() async {
    showLoading('Fetching Data');
    var response = await RemoteServices()
        .get(baseUrl, 'terms-conditions')
        .catchError((error) {
          hideLoading();
          handleError(error);
    });
    if (response == null) return;
    var responseJson = jsonDecode(response); // Assuming response is a JSON string
    termsModel = TermsModel.fromJson(responseJson);
     update();
  }
}
