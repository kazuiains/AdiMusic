import 'package:musik/app/config/app_colors.dart';
import 'package:flutter/material.dart';

class TextStyles {
  static TextStyle labelWhite = const TextStyle(
    color: Colors.white,
  );
  static TextStyle labelSemiGray = TextStyle(
    color: AppColors.semiGrayColor,
  );
  static TextStyle labelBlack = const TextStyle(
    color: AppColors.text,
  );
  static TextStyle labelHeader = labelWhite.copyWith(
    fontSize: 22,
  );
  static TextStyle labelHeaderQuiz = labelBlack.copyWith(
    fontSize: 18,
  );
  static TextStyle labelSmall = labelWhite.copyWith(
    fontSize: 12,
  );
  static TextStyle labelSmallIcon = labelSemiGray.copyWith(
    fontSize: 13,
  );
}
