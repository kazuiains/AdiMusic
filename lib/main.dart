import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:musik/app/config/app_config.dart';
import 'package:musik/app/services/local_storage.dart';
import 'package:musik/presentation/ui/widgets/base_loading_view.dart';

import 'presentation/ui/pages/my_app_page.dart';

void main() async {
  await _initMyApp();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black.withOpacity(0.002),
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge,
  );
  runApp(const MyAppPage());
}

Future _initMyApp() async {
  //ensureInitialized for initialize device orientation
  WidgetsFlutterBinding.ensureInitialized();

  //flavor
  AppConfig(
    flavor: Flavor.development,
  );

  //local storage service (hive)
  await Get.putAsync(() => LocalStorage().init());

  //easy loading
  BaseLoadingView.init();
}
