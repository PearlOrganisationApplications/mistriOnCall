import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class CommonFunctions{

 static void customTheme() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarDividerColor: null,
      statusBarColor: Color(0xFF5F60B9),
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ));
  }
}