import 'package:co_run/resources/colors.dart';
import 'package:flutter/material.dart';

abstract class MyTheme {
  static TextStyle large(
          {Color themeColor, FontWeight fontWeight = FontWeight.bold}) =>
      TextStyle(
        color: themeColor ?? MyColor.defaultColor,
        fontWeight: fontWeight,
        fontSize: 30,
      );
  static TextStyle h1(
          {Color themeColor, FontWeight fontWeight = FontWeight.bold}) =>
      TextStyle(
        color: themeColor ?? MyColor.defaultColor,
        fontWeight: fontWeight,
        fontSize: 26,
      );
  static TextStyle h2(
          {Color themeColor, FontWeight fontWeight = FontWeight.bold}) =>
      TextStyle(
        color: themeColor ?? MyColor.defaultColor,
        fontWeight: fontWeight,
        fontSize: 24,
      );
  static TextStyle h3(
          {Color themeColor, FontWeight fontWeight = FontWeight.bold}) =>
      TextStyle(
        color: themeColor ?? MyColor.defaultColor,
        fontWeight: fontWeight,
        fontSize: 22,
      );
  static TextStyle h4(
          {Color themeColor, FontWeight fontWeight = FontWeight.bold}) =>
      TextStyle(
        color: themeColor ?? MyColor.defaultColor,
        fontWeight: fontWeight,
        fontSize: 20,
      );
  static TextStyle h5(
          {Color themeColor, FontWeight fontWeight = FontWeight.bold}) =>
      TextStyle(
        color: themeColor ?? MyColor.defaultColor,
        fontWeight: fontWeight,
        fontSize: 18,
      );
  static TextStyle h6(
          {Color themeColor, FontWeight fontWeight = FontWeight.bold}) =>
      TextStyle(
        color: themeColor ?? MyColor.defaultColor,
        fontWeight: fontWeight,
        fontSize: 16,
      );
  static TextStyle h7(
          {Color themeColor, FontWeight fontWeight = FontWeight.bold}) =>
      TextStyle(
        color: themeColor ?? MyColor.defaultColor,
        fontWeight: fontWeight,
        fontSize: 14,
      );
  static TextStyle h8(
          {Color themeColor, FontWeight fontWeight = FontWeight.bold}) =>
      TextStyle(
        color: themeColor ?? MyColor.defaultColor,
        fontWeight: fontWeight,
        fontSize: 12,
      );
  static TextStyle h9(
          {Color themeColor, FontWeight fontWeight = FontWeight.bold}) =>
      TextStyle(
        color: themeColor ?? MyColor.defaultColor,
        fontWeight: fontWeight,
        fontSize: 10,
      );
  static TextStyle normal({Color themeColor}) => TextStyle(
        color: themeColor ?? MyColor.defaultColor,
      );
}

class MyBorderRadius {
  static double get large => 30.0;
  static double get medium => 20.0;
  static double get small => 10.0;
}

class MyPadding {
  static double get s1 => 4.0;
  static double get s2 => 8.0;
  static double get s3 => 12.0;
  static double get s4 => 16.0;
  static double get s5 => 20.0;
  static double get s6 => 24.0;
  static double get s7 => 28.0;
  static double get s8 => 32.0;
}

class MyCircleAvatarRadius {
  static double get normal => 35.0;
  static double get big => 60.0;
}
