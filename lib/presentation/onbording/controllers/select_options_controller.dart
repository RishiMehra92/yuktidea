
import 'package:get/get.dart';

import '../../../controllers/base_controller.dart';
import '../../../helper/dialog_helper.dart';
import '../../../services/app_exceptions.dart';
import '../../../services/remote_services.dart';
import '../../../util/utils.dart';



class SelectOptionsController extends GetxController with BaseController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  onClose() {
    super.onClose();
  }

  void logOut() async {
    showLoading('Posting data...');
    var response = await RemoteServices()
        .post(baseUrl, '/logout', null)
        .catchError((error) {
      if (error is BadRequestException) {
        DialogHelper.showErroDialog(description: "Unauthorized");

      } else {
        DialogHelper.showErroDialog(description: "Unauthorized");
      //  handleError(error);
      }
    });
    if (response == null) return;
    hideLoading();

    // storage.write("token", "");
    // Get.offAll(() => LoginScreen());
  }
}
