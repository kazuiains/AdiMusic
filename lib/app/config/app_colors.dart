import 'package:flutter/material.dart';

class AppColors {
  static const int _primaryLightValue = 0xff55cced;
  static const int _primaryValue = 0xff25a7cb;
  static const int _primaryDarkValue = 0xff137f97;
  static const Map<int, Color> primaryColorList = <int, Color>{
    0: Color(0xffffffff),
    50: Color(0xffe1f6fd),
    100: Color(0xffb4e9f9),
    200: Color(0xff84dbf4),
    300: Color(_primaryLightValue),
    400: Color(0xff37c1e6),
    500: Color(0xff2bb7df),
    600: Color(_primaryValue),
    700: Color(0xff1b93b0),
    800: Color(_primaryDarkValue),
    900: Color(0xff035d6b)
  };

  static const int _textAppBarValue = 0xff434343;
  static const int _labelContentHeaderValue = 0xff7b7b7b;
  static const int _primaryTextValue = 0xff000000;
  static const int _borderValue = 0xffc4c4c4;
  static const Map<int, Color> primaryTextColorList = <int, Color>{
    0: Color(0xffffffff),
    50: Color(0xfff5f5f5),
    100: Color(0xffe9e9e9),
    200: Color(0xffd9d9d9),
    300: Color(_borderValue),
    400: Color(0xff9d9d9d),
    500: Color(_labelContentHeaderValue),
    600: Color(0xff555555),
    700: Color(_textAppBarValue),
    800: Color(0xff262626),
    900: Color(_primaryTextValue)
  };

  static const MaterialColor primary = MaterialColor(
    _primaryValue,
    primaryColorList,
  );

  static const MaterialColor primaryLight = MaterialColor(
    _primaryLightValue,
    primaryColorList,
  );

  static const MaterialColor primaryDark = MaterialColor(
    _primaryDarkValue,
    primaryColorList,
  );

  static const MaterialColor text = MaterialColor(
    _primaryTextValue,
    primaryTextColorList,
  );

  static Color bodyColor = Colors.white;
  static Color progressBarTrackBackgroundColor = Color(0xFFDADADA);
  static Color progressBarTrackColor = AppColors.primary;

  static Color semiGrayColor = const Color(0xFFC7C7C7);
  static Color itemListColor = const Color(0xff193469);
  static Color overlayWhite = const Color(0x1AFFFFFF);

  static Color wrongColor = const Color(0xffF44336);
  static Color correctColor = const Color(0xff447B60);

  static Color errorColor = const Color(0xffC6392A);
  static Color warningColor = const Color(0xffFF9800);
}
