import 'package:flutter/material.dart';
import 'package:musik/app/config/app_dimens.dart';

class LayoutHelper {
  static bool isOverflow({
    required String text,
    double maxWidth = AppDimens.maxWidthForTextMove,
    TextStyle? style,
    int maxLines = 1,
    TextDirection textDirection = TextDirection.ltr,
  }) {
    final span = TextSpan(
      text: text,
      style: style,
    );
    final tp = TextPainter(
      text: span,
      textDirection: textDirection,
      maxLines: maxLines,
    );
    tp.layout(maxWidth: maxWidth);
    return tp.didExceedMaxLines;
  }
}
