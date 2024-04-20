import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

String formatDate(String dbDate) {
  List<String> dateTimeList = dbDate.split(" ");
  List<String> dateList = dateTimeList.first.split("-");
  String dateTime = "${dateList[1]}-${dateList.last}-${dateList.first} ${dateTimeList.last}";
  // String dateTime = dateList[1] +
  //     "-" +
  //     dateList.last +
  //     "-" +
  //     dateList.first +
  //     " " +
  //     dateTimeList.last;
  return dateTime;
}
//testing url
const baseUrl='https://studylancer.yuktidea.com/api/';

//staging url
//const baseUrl='http://tickvent.crebos.online/api';

//production url
//const baseUrl = "http://apiodoo.accept.crebos.online/api";

var storage = GetStorage();

Size screenSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

double screenHeight(BuildContext context,
    {double dividedBy = 1, double reducedBy = 0.0}) {
  return (screenSize(context).height - reducedBy) / dividedBy;
}

double screenHeightExcludingToolbar(BuildContext context,
    {double dividedBy = 1}) {
  return screenHeight(context, dividedBy: dividedBy, reducedBy: kToolbarHeight);
}

double getCorrectHeightFromPercentage(int percentage, BuildContext context) {
  return (screenHeightExcludingToolbar(context) -
          MediaQuery.of(context).padding.top) / 100 * percentage;
}

String convertDateFormat(String inputDate) {

  DateTime dateTime = DateFormat('yyyy-MM-dd HH:mm:ss').parse(inputDate);
  String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);
  return formattedDate;
}