import 'dart:math';

import 'package:flutter_research/tag_controller.dart';
import 'package:flutter_research/test/test_controller.dart';
import 'package:get/get.dart';

class TestBinding extends Bindings {
  @override
  void dependencies() {
    var tag = TestController().tag;
    TagController().tagsTest.add(tag);
    print("TAG tag: $tag");
    Get.lazyPut<TestController>(() => TestController(), tag: tag);
  }
}
