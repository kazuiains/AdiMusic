import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:musik/app/config/app_colors.dart';
import 'package:musik/app/config/app_config.dart';
import 'package:musik/app/config/routes/app_pages.dart';
import 'package:musik/app/config/routes/app_routes.dart';
import 'package:musik/presentation/get/home/home_binding.dart';
import 'package:musik/presentation/ui/pages/home/home_page.dart';

class MyAppPage extends StatelessWidget {
  const MyAppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConfig.instance!.appName,
      initialRoute: AppRoutes.root,
      getPages: AppPages.pages,
      theme: ThemeData(
        primarySwatch: AppColors.primary,
        primaryColor: AppColors.primary,
        primaryColorLight: AppColors.primaryLight,
        primaryColorDark: AppColors.primaryDark,
        scaffoldBackgroundColor: AppColors.bodyColor,
      ),
      home: HomePage(),
      initialBinding: HomeBinding(),
      builder: EasyLoading.init(),
    );
  }
}
