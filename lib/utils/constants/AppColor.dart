import 'package:flutter/material.dart';

class AppColor {
  static const lightblue = Color(0xFFF6F7F9);
  static const blue = Color(0xFF5F60B9);
  static const textGrey = Color(0xFF6C757D);
  static const textBlack = Color(0xFF1C1F34);
  static const cardGrey = Color(0xFFF0F0FA);
  static const cardBorder = Color(0xFFEBEBEB);

  //TODO TEXT STYLE
  static const headingTextStyle = TextStyle(
      fontSize: 16.0,
      color: textBlack,
      fontFamily: "WorkSans",
      fontWeight: FontWeight.bold);
  static const subHeadingTextStyle = TextStyle(
    fontSize: 14.0,
    fontFamily: "WorkSans",
    color: Color(0xFF1C1F34),
    height: 2.0,
  );
  static const regularTextStyle = TextStyle(
    fontSize: 14.0,
    fontFamily: "WorkSans",
    color: Color(0xFF616888),
    fontWeight: FontWeight.normal,
    height: 2.0,
  );
  static const titleTextStyle = TextStyle(
      fontSize: 14.0,
      color: textGrey,
      fontFamily: "WorkSans",
      fontWeight: FontWeight.bold);
  static const subTitleTextStyle = TextStyle(
      fontSize: 12.0,
      color: textGrey,
      fontFamily: "WorkSans",
      fontWeight: FontWeight.w600);
}
