import 'dart:convert';

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

  static List<String> getKeywordList() {
    List<String> keywordList = [];
    String? jsonData = localStorage.getStringValue(key: searchKey);
    if (jsonData != null && jsonData.isNotEmpty) {
      keywordList = (jsonDecode(jsonData) as List<dynamic>).cast<String>();
    }
    return keywordList;
  }

  static saveKeyword(String? data) {
    List<String> keywordList = getKeywordList();

    if (data != null) {
      if (keywordList.isNotEmpty) {
        if (!keywordList.contains(data)) {
          keywordList.add(data);
        }
      } else {
        keywordList.add(data);
      }
    }

    localStorage.saveStringValue(
      key: searchKey,
      value: jsonEncode(keywordList),
    );
  }
}
