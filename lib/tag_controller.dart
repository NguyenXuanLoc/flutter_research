import 'package:flutter_research/test/test_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class TagController {
  List<String> tagsTest = [];

  TestController? findDetailOrderController() {
    TestController? controller;
    for (var i = 0; i < tagsTest.length; i++) {
      try {
        controller = Get.find<TestController>(tag: tagsTest[i]);
      } catch (e) {
        continue;
      }
    }
    return controller;
  }
}
