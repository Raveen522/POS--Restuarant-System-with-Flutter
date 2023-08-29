import 'package:flutter/material.dart';

var themeText = const TextTheme(
  headline1: TextStyle(
      fontFamily: 'Roboto', fontSize: 30, fontWeight: FontWeight.w700),
  headline2: TextStyle(
      fontFamily: 'Roboto', fontSize: 25, fontWeight: FontWeight.w700),
  headline3: TextStyle(
      fontFamily: 'Roboto', fontSize: 20, fontWeight: FontWeight.w700),
  bodyText1: TextStyle(
      fontFamily: 'Roboto', fontSize: 17, fontWeight: FontWeight.w500),
  bodyText2: TextStyle(
      fontFamily: 'Roboto', fontSize: 17, fontWeight: FontWeight.w500),
  subtitle1: TextStyle(
      fontFamily: 'Roboto', fontSize: 12, fontWeight: FontWeight.w500),
);

var themeButton = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        textStyle: const TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w600,
        )));
