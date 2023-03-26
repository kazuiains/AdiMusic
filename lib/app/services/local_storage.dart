import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalStorage extends GetxService {
  final _boxIdentifier = 'localStorageMusic-25032023';

  Future<LocalStorage> init() async {
    await Hive.initFlutter();
    await Hive.openBox(_boxIdentifier);
    return this;
  }

  String? getStringValue({required String key}) {
    var box = Hive.box(_boxIdentifier);
    return box.get(
      key,
      defaultValue: "",
    );
  }

  saveStringValue({required String key, String? value}) {
    var box = Hive.box(_boxIdentifier);
    return box.put(key, value);
  }

  delete({required String key}) {
    var box = Hive.box(_boxIdentifier);
    box.delete(key);
  }
}
