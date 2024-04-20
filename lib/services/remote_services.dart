import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../util/utils.dart';
import 'app_exceptions.dart';

class RemoteServices {
  static const int TIME_OUT_DURATION = 59;

  static var client = http.Client();
  Future<dynamic> get(String baseUrl, String api) async {
    var uri = Uri.parse(baseUrl + api);
    final Map<String, String> headers;
    if (storage.read('token').toString().isEmpty ||
        storage.read('token') == null) {
      headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      };
    } else {
      headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${storage.read('token')}'
      };
    }

    try {
      var response = await client
          .get(uri, headers: headers)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));

      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }



  //POST
  Future<dynamic> post(String baseUrl, String api, dynamic payloadObj) async {
    var uri = Uri.parse(baseUrl + api);
    print(uri);
    print(payloadObj);
    var payload = json.encode(payloadObj);
    final Map<String, String> headers;
    if (storage.read('token').toString().isEmpty ||
        storage.read('token') == null) {
      headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      };
    } else {
      headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${storage.read('token')}'
      };
    }
    try {
      var response = await http
          .post(uri, headers: headers, body: payload)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));

      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }



  //DELETE
  //OTHER

  dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;

      case 201:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;

      case 400:
        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 401:
        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());

      // DialogHelper.showUnAuthenticatedDialog(description: 'You are logged out automatically, because you are logged in on another device');

      case 403:
        throw UnAuthorizedException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());

      case 404:
        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());

      case 405:
        throw AlreadyUsedException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());

      case 422:
        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured with code : ${response.statusCode}',
            response.request!.url.toString());
    }
  }
}
