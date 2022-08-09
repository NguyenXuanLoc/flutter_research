import 'package:flutter_research/app/routes/app_pages.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    Get.toNamed(Routes.PRODUC_DETAIL);
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
