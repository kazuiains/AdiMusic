import 'package:musik/app/config/app_colors.dart';
import 'package:musik/app/config/app_dimens.dart';
import 'package:musik/app/config/app_strings.dart';
import 'package:musik/app/config/styles/button_styles.dart';
import 'package:musik/app/types/modal_type.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseModalView {
  static modalDialog({
    ModalType modalType = ModalType.success,
    required String description,
    String? title,
    Function? onYes,
    Function? onNo,
    bool dismissible = false,
  }) {
    Get.defaultDialog(
      title: "",
      backgroundColor: Colors.white,
      radius: AppDimens.roundedSmall,
      content: Padding(
        padding: const EdgeInsets.only(
          bottom: 0,
          left: 24,
          right: 24,
          top: 0,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                bottom: 16,
              ),
              child: Row(
                children: [
                  Icon(
                    modalType.icon,
                    color: modalType.color,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: Text(
                      title ?? modalType.title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: modalType.color,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              description,
              style: TextStyle(
                height: 1.5,
                color: AppColors.text[500],
                fontSize: 14,
              ),
            )
          ],
        ),
      ),
      actions: [
        Container(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  if (onNo != null) {
                    onNo();
                  } else {
                    Get.back();
                  }
                },
                style: ButtonStyles.buttonModalYesNo(),
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    AppStrings.modalButtonNo,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: modalType.colorButtonNo,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: TextButton(
                  onPressed: () {
                    if (onYes != null) {
                      onYes();
                    } else {
                      Get.back();
                    }
                  },
                  style: ButtonStyles.buttonModalYesNo(),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      AppStrings.modalButtonYes,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: modalType.colorButtonYes,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
      titlePadding: const EdgeInsets.all(0),
      contentPadding: const EdgeInsets.all(0),
      barrierDismissible: dismissible,
    );
  }
}
