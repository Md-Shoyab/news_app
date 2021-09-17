import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'app/services/api_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put<ApiHelper>(
    ApiHelper(),
  );
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  runZonedGuarded<Future<void>>(
    () async {
      runApp(
        GetMaterialApp(
          title: 'Recipes',
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          debugShowCheckedModeBanner: false,
        ),
      );
    },
    (dynamic error, StackTrace stackTrace) {
      print('<<----------ERROR--------->> \n$error');
      print('<<----------STACK TRACE--------->> \n$stackTrace');
    },
  );
}
