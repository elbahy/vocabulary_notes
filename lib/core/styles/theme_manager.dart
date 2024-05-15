import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vocabulary_notes/core/styles/colors.dart';

class ThemeManager {
  static ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.black,
    fontFamily: 'PoetsenOne',
    appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.black,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.black,
        ),
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: AppColors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        )),
  );
}
