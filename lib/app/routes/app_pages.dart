import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/produc_detail/bindings/produc_detail_binding.dart';
import '../modules/produc_detail/views/produc_detail_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PRODUC_DETAIL,
      page: () => ProducDetailView(),
      binding: ProducDetailBinding(),
    ),
  ];
}
