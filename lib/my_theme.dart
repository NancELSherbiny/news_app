import 'dart:ui';

import 'package:flutter/material.dart';

class MyTheme {
  static const Color primaryColor = Color(0xff39A552);
  static const Color whiteColor = Color(0xffffffff);
  static const Color greyColor = Color(0xff707070);
  static const Color redColor = Color(0xffC91C22);
  static const Color darkBlueColor = Color(0xff003E90);
  static const Color orangeColor = Color(0xffCF7E48);
  static const Color yellowColor = Color(0xffF2D352);
  static const Color pinkColor = Color(0xffED1E79);
  static const Color lightBlueColor = Color(0xff4882CF);
  static ThemeData lightTheme = ThemeData(

      textTheme: TextTheme(
          titleLarge: TextStyle(
              color: whiteColor, fontWeight: FontWeight.bold, fontSize: 24),
          titleSmall: TextStyle(
              color: greyColor, fontWeight: FontWeight.bold, fontSize: 18),
          titleMedium: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22) ),
      appBarTheme: AppBarTheme(color: primaryColor,
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
          ),
        ),),
  );
}