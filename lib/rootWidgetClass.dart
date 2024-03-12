import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_login/app/modules/home/views/home_view.dart';
import 'package:google_login/app/routes/app_pages.dart';

import 'app/ApiServices/BinderData.dart';
import 'app/AppTheme/theme_controller.dart';
import 'app/AppTheme/themes.dart';
import 'app/data/common.dart';

class RootWidgetClass extends StatefulWidget {
   const RootWidgetClass({Key? key}) : super(key: key);

  @override
  State<RootWidgetClass> createState() => _MotelAppState();
}

class _MotelAppState extends State<RootWidgetClass> {

  // when this application open every time on that time we check and update some theme data
  void _setFirstTimeSomeData(BuildContext context, ThemeData theme) {
    _setStatusBarNavigationBarTheme(theme);
    //we call some theme basic data set in app like color, font, theme mode, language
    Get.find<ThemeController>()
        .checkAndSetThemeMode(MediaQuery.of(context).platformBrightness);
  }

  void _setStatusBarNavigationBarTheme(ThemeData themeData) {
    final brightness = !kIsWeb && Platform.isAndroid
        ? themeData.brightness == Brightness.light
        ? Brightness.dark
        : Brightness.light
        : themeData.brightness;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: brightness,
      statusBarBrightness: brightness,
      systemNavigationBarColor: themeData.backgroundColor,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: brightness,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (controller) {
        final ThemeData theme = AppTheme.getThemeData;
        return GetMaterialApp(
          navigatorKey: navigatorKey,
          title: 'Google SignIn',
          debugShowCheckedModeBanner: false,
          theme: theme,
          // routes: _buildRoutes(),
          initialBinding: BinderData(),
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          builder: (BuildContext context, Widget? child) {
            _setFirstTimeSomeData(context, theme);
            return Directionality(
              textDirection:TextDirection.ltr,
              child: MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  textScaleFactor: MediaQuery.of(context).size.width > 360
                      ? 1.0
                      : MediaQuery.of(context).size.width >= 340
                      ? 0.9
                      : 0.8,
                ),
                child: child ?? const SizedBox(),
              ),
            );
          },
        );
      },
    );
  }



}