import 'package:musik/app/config/app_colors.dart';
import 'package:musik/presentation/ui/widgets/base_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'text_styles.dart';

class AppBarStyles {
  static normalAppbar({
    String? title,
    List<Widget>? action,
    VoidCallback? onBack,
  }) {
    return AppBar(
      titleSpacing: 0,
      title: Text(
        title ?? "",
        style: TextStyles.labelWhite,
      ),
      leading: IconButton(
        icon: const Icon(
          Icons.chevron_left,
          size: 36,
        ),
        onPressed: onBack ?? () => Get.back(),
        color: Colors.white,
      ),
      centerTitle: true,
      shadowColor: Colors.grey.withOpacity(0),
      backgroundColor: AppColors.bodyColor,
      elevation: 0,
      actions: action,
    );
  }

  static quizAppbar({
    String? title,
    double? value,
    required VoidCallback onPressed,
  }) {
    return AppBar(
      titleSpacing: 0,
      title: Text(
        title ?? "",
        style: TextStyles.labelWhite,
      ),
      leading: IconButton(
        icon: const Icon(
          Icons.chevron_left,
          size: 36,
        ),
        onPressed: () => Get.back(),
        color: Colors.white,
      ),
      centerTitle: true,
      shadowColor: Colors.grey.withOpacity(0),
      backgroundColor: AppColors.bodyColor,
      elevation: 0,
      actions: [
        BaseView.buildExitButton(onPressed: onPressed),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(4.0),
        child: LinearProgressIndicator(
          backgroundColor: AppColors.progressBackgroundColor,
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.progressColor),
          value: value ?? 0,
        ),
      ),
    );
  }
}
