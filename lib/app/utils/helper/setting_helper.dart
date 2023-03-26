import 'package:get/get.dart';
import 'package:musik/app/config/constants/preference_constants.dart';
import 'package:musik/app/services/local_storage.dart';

class SettingHelper {
  static final localStorage = Get.find<LocalStorage>();

  static String? getLastSearchData() {
    return localStorage.getStringValue(key: musicKey);
  }

  static saveDataSearch(String? data) {
    localStorage.saveStringValue(
      key: musicKey,
      value: data,
    );
  }
}
