import 'package:flutter/material.dart';
import 'package:musik/app/config/app_colors.dart';
import 'package:musik/app/config/app_dimens.dart';

class TextStyles {
  static TextStyle homeTitle = const TextStyle(
    color: AppColors.text,
    fontSize: AppDimens.homeItemListViewFontSizeTitle,
  );

  static TextStyle homeSubTitle = TextStyle(
    color: AppColors.text[400],
    fontSize: AppDimens.homeItemListViewFontSizeSubTitle,
    fontWeight: FontWeight.w500,
  );

  static TextStyle homeBottomNavTitle = TextStyles.homeTitle.copyWith(
    fontSize: AppDimens.homeBottomNavFontSizeTitle,
    fontWeight: FontWeight.bold,
  );

  static TextStyle homeBottomNavSubTitle = TextStyles.homeSubTitle;
}
