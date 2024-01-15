import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonFunctions {
  static void customTheme(Color statusColor) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarDividerColor: null,
      statusBarColor: statusColor,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ));
  }
}
