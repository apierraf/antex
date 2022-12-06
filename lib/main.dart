import 'dart:io';

import 'package:antex/routes/app_pages.dart';
import 'package:antex/routes/app_routes.dart';
import 'package:antex/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'utils/my_http_overrides.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Colaborador ANTEX',
      initialRoute: AppRoutes.LOGIN,
      getPages: AppPages.list,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kColorApp,
      ),
      //home: LoginPage(),
    );
  }
}
