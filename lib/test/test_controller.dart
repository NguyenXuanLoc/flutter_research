import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class TestController extends GetxController {
  final String tag;
  final test = 0.obs;

  TestController() : tag = DateTime.now().millisecondsSinceEpoch.toString();

  void increase() {
    test.value = test.value + 1;
  }

  @override
  void onInit() {
    print("TAG INIT");
    super.onInit();
  }

  @override
  void onReady() {
    print("TAG ONREADY");
    super.onReady();
  }
}
