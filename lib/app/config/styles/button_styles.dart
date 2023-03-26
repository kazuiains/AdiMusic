import 'package:musik/app/config/app_colors.dart';
import 'package:musik/app/config/app_dimens.dart';
import 'package:flutter/material.dart';

class ButtonStyles {
  static ButtonStyle buttonFullColor = ButtonStyle(
    padding: MaterialStateProperty.all<EdgeInsets>(
      const EdgeInsets.all(15),
    ),
    backgroundColor: MaterialStateProperty.all<Color>(
      AppColors.primary,
    ),
    overlayColor: MaterialStateProperty.all<Color>(
      AppColors.overlayWhite,
    ),
    foregroundColor: MaterialStateProperty.all<Color>(
      Colors.white,
    ),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          25.0,
        ),
        side: const BorderSide(
          color: AppColors.primary,
        ),
      ),
    ),
  );

  static ButtonStyle buttonBorder = buttonFullColor.copyWith(
    backgroundColor: MaterialStateProperty.all<Color>(
      Colors.transparent,
    ),
    foregroundColor: MaterialStateProperty.all<Color>(
      AppColors.primary,
    ),
  );

  static ButtonStyle buttonFullColorSquareRounded = buttonFullColor.copyWith(
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          4.0,
        ),
        side: const BorderSide(
          color: AppColors.primary,
        ),
      ),
    ),
  );

  static buttonModalYesNo({
    Color? rippleColor,
    double height = 48,
  }) {
    return ButtonStyle(
      padding: MaterialStateProperty.all(
        const EdgeInsets.all(16),
      ),
      backgroundColor: MaterialStateProperty.all(
        Colors.white,
      ),
      minimumSize: MaterialStateProperty.all(
        Size(
          kMinInteractiveDimension,
          height,
        ),
      ),
      overlayColor: MaterialStateProperty.all<Color>(
        rippleColor ?? Colors.black12,
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              AppDimens.roundedSmall,
            ),
          ),
          side: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
