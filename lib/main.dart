import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yuktidea/presentation/home/homepage.dart';
import 'package:yuktidea/presentation/onbording/view/select_country.dart';
import 'package:yuktidea/presentation/onbording/view/select_options_screen.dart';
import 'package:yuktidea/routes/Routes.dart';
import 'package:yuktidea/services/MyHttpOverrides.dart';
import 'package:yuktidea/util/AppTheme.dart';
 import 'package:get/get.dart';
 import 'package:get_storage/get_storage.dart';
import 'package:yuktidea/util/constant_text.dart';
import 'package:yuktidea/util/utils.dart';
Future<void> main() async {
  await GetStorage.init();
  HttpOverrides.global = MyHttpOverrides();
// Check if token is empty or null
  // storage.write("token", "157|hx4IKMyL4BMyJ0IJAvx8VZihT9TFn5reOCjb9SyB03ebf9e8");

  if (storage.read('token')?.toString().isEmpty ?? true) {
    // User is not logged in
    runApp(MyApp(isLoggedIn: false));
  } else {
    // User is logged in
    runApp(MyApp(isLoggedIn: true));
  }
}


class MyApp extends StatelessWidget {
  final bool isLoggedIn;
    MyApp({super.key, required this.isLoggedIn});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return SafeArea(
        child:  GetMaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
          theme: AppTheme.themeData,
      initialRoute:isLoggedIn ? '/homePage': Routes.getInitialRoute(),
      getPages: Routes.getRoutes(),
    )
    );
  }
}

