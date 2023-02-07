import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_constant.dart';

class AppTheme {
  static final ThemeData light = ThemeData(
    scaffoldBackgroundColor: AppConstant.backgroundColor,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    primaryColor: AppConstant.primaryColor,
    canvasColor: const Color.fromARGB(255, 226, 200, 53),
    cardTheme: const CardTheme(
      color: AppConstant.secondaryColor,
    ),
    primaryColorDark: AppConstant.primaryColor,
    iconTheme: const IconThemeData(
      color: AppConstant.appBlack,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.blueGrey,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
    ),
    brightness: Brightness.light,
    cardColor: AppConstant.appWhite,
    unselectedWidgetColor: Colors.black45,
    focusColor: AppConstant.primaryColor,
    dividerColor: AppConstant.appWhite,
    textTheme: TextTheme(
      headline1: GoogleFonts.solway(
          color: AppConstant.appBlack,
          fontSize: 30.sp,
          fontWeight: FontWeight.bold),
      headline2: GoogleFonts.solway(
          color: AppConstant.appBlack,
          fontSize: 24.sp,
          fontWeight: FontWeight.w600),
      headline3: GoogleFonts.solway(
          color: AppConstant.appBlack,
          fontSize: 18.sp,
          fontWeight: FontWeight.w500),
      headline4: GoogleFonts.solway(
          color: AppConstant.appBlack,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500),
      headline5: GoogleFonts.solway(
          color: AppConstant.appBlack,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500),
      headline6: GoogleFonts.solway(
          color: AppConstant.appBlack,
          fontSize: 13.sp,
          fontWeight: FontWeight.w400),
      subtitle1: GoogleFonts.solway(
          color: AppConstant.subtitleColor,
          fontSize: 11.sp,
          fontWeight: FontWeight.w300),
      subtitle2: GoogleFonts.solway(
          color: AppConstant.subtitleColor,
          fontSize: 11.sp,
          fontWeight: FontWeight.normal),
    ),
  );

  static final ThemeData dark = ThemeData(
    scaffoldBackgroundColor: AppConstant.backgroundColor,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    primaryColor: Colors.black12,
    primaryColorDark: Colors.black,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
    ),
    brightness: Brightness.dark,
    focusColor: Colors.white,
    dividerColor: AppConstant.appBlack,
    textTheme: TextTheme(
      headline1: GoogleFonts.solway(
        color: AppConstant.appWhite,
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
      ),
      headline2: GoogleFonts.solway(
        color: AppConstant.appWhite,
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
      ),
      headline3: GoogleFonts.solway(
        color: AppConstant.appWhite,
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
      ),
      headline4: GoogleFonts.solway(
        color: AppConstant.appWhite,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),
      headline5: GoogleFonts.solway(
        color: AppConstant.appWhite,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
      headline6: GoogleFonts.solway(
        color: AppConstant.appWhite,
        fontSize: 13.sp,
        fontWeight: FontWeight.w400,
      ),
      subtitle1: GoogleFonts.solway(
        color: AppConstant.subtitleColor,
        fontSize: 11.sp,
        fontWeight: FontWeight.w300,
      ),
      subtitle2: GoogleFonts.solway(
        color: AppConstant.subtitleColor,
        fontSize: 11.sp,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}
