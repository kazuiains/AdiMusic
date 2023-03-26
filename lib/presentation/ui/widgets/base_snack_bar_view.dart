import 'package:musik/app/config/app_colors.dart';
import 'package:musik/app/config/app_strings.dart';
import 'package:musik/app/types/snack_bar_type.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseSnackBarView {
  static snackBar({
    SnackBarType snackBarType = SnackBarType.success,
    required String message,
    String buttonText = AppStrings.snackBarClose,
    Function? onClick,
    IconData? icon,
    Color? color,
  }) {
    Get.snackbar(
      snackBarType.title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.white,
      colorText: AppColors.text[700],
      margin: const EdgeInsets.all(10),
      borderRadius: 0,
      icon: Icon(
        icon ?? snackBarType.icon,
        color: color ?? snackBarType.color,
      ),
      leftBarIndicatorColor: color ?? snackBarType.color,
      mainButton: TextButton(
        onPressed: () {
          if (onClick != null) {
            onClick();
          } else {
            Get.closeCurrentSnackbar();
          }
        },
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all<Color>(
            color ?? snackBarType.color,
          ),
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            color: AppColors.text[200]!,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
