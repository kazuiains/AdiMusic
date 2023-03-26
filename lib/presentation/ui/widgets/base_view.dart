import 'package:musik/app/config/app_dimens.dart';
import 'package:musik/app/config/app_strings.dart';
import 'package:musik/app/config/styles/text_styles.dart';
import 'package:flutter/material.dart';

class BaseView {
  static buildContentView({
    required List<Widget> children,
    GestureTapCallback? onTap,
    Color? color,
    double? radius,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(
          radius ?? AppDimens.roundedMedium,
        ),
      ),
      child: Card(
        color: color ?? Colors.white,
        elevation: 0,
        margin: const EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            radius ?? AppDimens.roundedMedium,
          ),
        ),
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(
              AppDimens.paddingAppBody,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            ),
          ),
        ),
      ),
    );
  }

  static buildExitButton({
    required VoidCallback onPressed,
  }) {
    return Container(
      margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
      child: TextButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(
              horizontal: 0,
              vertical: 0,
            ),
          ),
          minimumSize: MaterialStateProperty.all(
            const Size(
              kMinInteractiveDimension,
              36,
            ),
          ),
          overlayColor: MaterialStateProperty.all<Color>(Colors.black12),
        ),
        onPressed: onPressed,
        child: Text(
          AppStrings.exit,
          style: TextStyles.labelSmall,
        ),
      ),
    );
  }
}
