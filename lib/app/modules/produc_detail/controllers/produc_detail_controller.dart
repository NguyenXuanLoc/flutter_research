import 'dart:math';

import 'package:flutter_research/app/tag_utils.dart';
import 'package:get/get.dart';

class ProducDetailController extends GetxController {
  final String tag;
  ProducDetailController() : tag = Random().nextInt(100).toString();
  RxInt randomNumer = 1.obs;

  final count = 0.obs;
  @override
  void onInit() {
    randomNumer.value = Random().nextInt(100);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    TagUtils().tagsProductDetail.removeAt(0);

  }
  void increment() => count.value++;
}
