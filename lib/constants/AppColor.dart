import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class AppColor {
  AppColor._();
  //basic palette
  static const Color black = Colors.black;
  static const Color white = Colors.white;

  //hex codes
  static const Color blueColor = Color(0xFF2F39C5);
  static const Color activeButtonBlue = Color(0xFF2E3B62);
  static const Color pinBlue = Color(0xFF93D2F3);
  static const Color lightgrey = Color(0xff6a6c7b);
  //static const Color lightgrey = Color(0xff6a6c7b);
  


  //Gradient
  static const Gradient linearGradient = LinearGradient(
    begin: Alignment(0.0, 0.0),
    end: Alignment(0.707, -0.707),
    colors: [
      Color(0xffff9a9e),
      Color(0xfffad0c4),
      Color(0xfffad0c4),
     ],
   );
}