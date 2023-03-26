import 'package:flutter/material.dart';
import 'package:musik/app/config/app_colors.dart';
import 'package:musik/app/config/app_strings.dart';

enum ModalType { success, error, warning }

extension ModalTypeItem on ModalType {
  String get title {
    switch (this) {
      case ModalType.success:
        return AppStrings.modalSuccess;
      case ModalType.error:
        return AppStrings.modalError;
      case ModalType.warning:
        return AppStrings.modalWarning;
    }
  }

  IconData get icon {
    switch (this) {
      case ModalType.success:
        return Icons.check_circle_outline;
      case ModalType.error:
        return Icons.cancel_outlined;
      case ModalType.warning:
        return Icons.error_outline;
    }
  }

  Color get color {
    switch (this) {
      case ModalType.success:
        return AppColors.primaryLight;
      case ModalType.error:
        return AppColors.errorColor;
      case ModalType.warning:
        return AppColors.warningColor;
    }
  }

  Color get colorButtonYes {
    switch (this) {
      case ModalType.success:
        return AppColors.primaryLight;
      case ModalType.error:
        return AppColors.text[600]!;
      case ModalType.warning:
        return AppColors.warningColor;
    }
  }

  Color get colorButtonNo {
    switch (this) {
      case ModalType.success:
        return AppColors.text[600]!;
      case ModalType.error:
        return AppColors.errorColor;
      case ModalType.warning:
        return AppColors.text[600]!;
    }
  }
}
