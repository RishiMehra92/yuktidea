import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:yuktidea/controllers/base_controller.dart';
import 'package:yuktidea/presentation/onbording/models/LoginResponse.dart';
import '../../../services/remote_services.dart';
import '../../../util/constant_text.dart';
import '../../../util/utils.dart';
 import '../models/CountryModel.dart';
import '../models/PostSelectedCountry.dart';
import '../models/SelectCountryResponse.dart';
import '../models/VerifyOTPResponse.dart';

class AuthController extends GetxController with BaseController {
  CountryModel? countryModel;
  List<Datum> filteredCountries = [];
  LoginResponse? loginResponse;
  VerifyOtpResponse? verifyOtpResponse;
  SelectCountryResponse? selectCountryResponse;
  PostSelectedCountry? postSelectedCountry;
  TextEditingController pintextEditingController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  final TextEditingController phoneTextEditingController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  var selectedCountryId="".obs;


  @override
  void onInit() {
    getCountrylist();
    super.onInit();
  }

  void getCountrylist() async {
     var response = await RemoteServices().get(baseUrl, 'countries').catchError((error) {
       handleError(error);
    });
    if (response == null) return;
    var responseJson =
        jsonDecode(response); // Assuming response is a JSON string
    countryModel = CountryModel.fromJson(responseJson);
     filteredCountries=List.from(countryModel!.data as Iterable);
    update();
  }

  void studentLogin(countyCode, loginType, bool ispageOpen, flagImage) async {
    if(phoneTextEditingController.text.trim().isEmpty){
      showSnackbar("Alert!", "Please enter your mobile number!");

    }else {

      showLoading(loading);
      var request = {
        'tel_code': countyCode.trim(),
        'phone': phoneTextEditingController.text.trim()
      };
      var response = await RemoteServices().post(
          baseUrl, 'student/login', request).catchError((error) {
        handleError(error);
        hideLoading();
      });
      if (response == null) return;
      var responseJson =
      jsonDecode(response); // Assuming response is a JSON string
      loginResponse = LoginResponse.fromJson(responseJson);
      hideLoading();
      if(ispageOpen){
        Get.toNamed("verifyPhoneNumber", arguments: {
          'countyCode': '${countyCode.trim()}',
          'phone': phoneTextEditingController.text.trim(),
          'loginType': loginType,
          'flagImage':flagImage
        });

      }
      update();

    }
  }

  void counsellorLogin(countyCode, loginType, bool ispageOpen, flagImage) async {
    showLoading(loading);
    var request = {
      'tel_code': countyCode.trim(),
      'phone': phoneTextEditingController.text.trim()
    };
    var response = await RemoteServices().post(baseUrl, 'counsellor/login',request).catchError((error) {
      handleError(error);
      hideLoading();
    });
    if (response == null) return;
    var responseJson =
    jsonDecode(response); // Assuming response is a JSON string
    loginResponse = LoginResponse.fromJson(responseJson);
    if(ispageOpen){
      Get.toNamed("verifyPhoneNumber", arguments: {
        'countyCode': '${countyCode.trim()}',
        'phone': phoneTextEditingController.text.trim().toString(),
        'loginType': loginType,
        'flagImage':flagImage
      });
      update();
      hideLoading();
    }
   }

  void resendOtp(countyCode) async {
    showLoading(loading);
    var request = {
        'phone': '${countyCode.trim()}${ phoneTextEditingController.text.trim()}'
    };
    var response = await RemoteServices().post(baseUrl, 'resend-otp',request).catchError((error) {
      handleError(error);
    });
    if (response == null) return;
    hideLoading();
    var responseJson =
    jsonDecode(response); // Assuming response is a JSON string
    countryModel = CountryModel.fromJson(responseJson);
    update();
  }

  void verifyOtp(phone) async {
    showLoading(loading);
    var request = {
        'code':  pintextEditingController.text.trim(),
        'phone':phone
    };
    var response = await RemoteServices().post(baseUrl, 'verify-otp',request).catchError((error) {
      handleError(error);
      hideLoading();
    });
    if (response == null) return;
    hideLoading();
    var responseJson = jsonDecode(response); // Assuming response is a JSON string
    verifyOtpResponse = VerifyOtpResponse.fromJson(responseJson);
    debugPrint("authToken=== ${ verifyOtpResponse!.data!.accessToken}");
    storage.write('token', verifyOtpResponse!.data!.accessToken);
    Get.toNamed("selectCountry");
    update();
  }

  void selectCountry() async {

    var response = await RemoteServices().get(baseUrl, 'select/country').catchError((error) {
      handleError(error);
    });
    if (response == null) return;

    var responseJson = jsonDecode(response); // Assuming response is a JSON string
    selectCountryResponse = SelectCountryResponse.fromJson(responseJson);

    update();
  }


  void postCountry() async {
    if(selectedCountryId.value.isEmpty){
      showSnackbar("Alert!", "Please select Country!");
    }else{
      showLoading("Loading...");
      var request = {
        'country_id':  selectedCountryId.value,
      };
      var response = await RemoteServices().post(baseUrl, 'select/country',request).catchError((error) {
        hideLoading();
        handleError(error);
      });

      if (response == null) return;
      hideLoading();
      var responseJson =
      jsonDecode(response); // Assuming response is a JSON string
      postSelectedCountry = PostSelectedCountry.fromJson(responseJson);
      Get.toNamed("homePage");
      update();
    }

  }



}
