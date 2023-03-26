import 'package:musik/app/config/app_colors.dart';
import 'package:musik/app/config/app_strings.dart';
import 'package:flutter/material.dart';

enum SnackBarType { success, error, warning, notification }

extension SnackBarItem on SnackBarType {
  String get title {
    switch (this) {
      case SnackBarType.success:
        return AppStrings.snackBarSuccess;
      case SnackBarType.error:
        return AppStrings.snackBarError;
      case SnackBarType.warning:
        return AppStrings.snackBarWarning;
      case SnackBarType.notification:
        return AppStrings.snackBarNotification;
    }
  }

  IconData get icon {
    switch (this) {
      case SnackBarType.success:
        return Icons.check_circle_outline;
      case SnackBarType.error:
        return Icons.cancel_outlined;
      case SnackBarType.warning:
        return Icons.error_outline;
      case SnackBarType.notification:
        return Icons.notifications_on_outlined;
    }
  }

  Color get color {
    switch (this) {
      case SnackBarType.success:
        return AppColors.primaryLight;
      case SnackBarType.error:
        return AppColors.errorColor;
      case SnackBarType.warning:
        return AppColors.warningColor;
      case SnackBarType.notification:
        return AppColors.text[800]!;
    }
  }
}
