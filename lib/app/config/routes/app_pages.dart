import 'package:get/get.dart';
import 'package:musik/app/config/routes/app_routes.dart';
import 'package:musik/presentation/get/detail/detail_binding.dart';
import 'package:musik/presentation/get/home/home_binding.dart';
import 'package:musik/presentation/ui/pages/detail/detail_page.dart';
import 'package:musik/presentation/ui/pages/home/home_page.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.detail,
      page: () => DetailPage(),
      binding: DetailBinding(),
    ),
  ];
}
