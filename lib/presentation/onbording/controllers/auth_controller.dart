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

  var loginType="";
  var countryCode="";
  var flgImage="";



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

  void studentLogin( bool ispageOpen) async {
    if(phoneTextEditingController.text.trim().isEmpty){
      showSnackbar("Alert!", "Please enter your mobile number!");

    }else {

      showLoading(loading);
      var request = {
        'tel_code': countryCode,
        'phone': phoneTextEditingController.text.trim()
      };
      var response = await RemoteServices().post(
          baseUrl, 'student/login', request).catchError((error) {
        handleError(error);
        hideLoading();
      });
      if (response == null) return;
      var responseJson = jsonDecode(response); // Assuming response is a JSON string
      loginResponse = LoginResponse.fromJson(responseJson);
      hideLoading();
      if(ispageOpen){
        Get.toNamed("verifyPhoneNumber", arguments: {
          'countyCode': countryCode,
          'phone': phoneTextEditingController.text.trim(),
          'loginType': loginType,
          'flagImage':flgImage
        });
      }
      update();

    }
  }

  void counsellorLogin(bool ispageOpen) async {
    showLoading(loading);
    var number=phoneTextEditingController.text.trim();
    var request = {
      'tel_code': countryCode,
      'phone': number
    };
    var response = await RemoteServices().post(baseUrl, 'counsellor/login',request).catchError((error) {
      handleError(error);
      hideLoading();
    });
    if (response == null) return;
    var responseJson = jsonDecode(response); // Assuming response is a JSON string
    loginResponse = LoginResponse.fromJson(responseJson);
    if(ispageOpen){
      hideLoading();
      Get.toNamed("verifyPhoneNumber");
      update();
    // , arguments: {
    // 'countyCode': countryCode,
    // 'phone': number,
    // 'loginType': loginType,
    // 'flagImage':flgImage
    // }

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
