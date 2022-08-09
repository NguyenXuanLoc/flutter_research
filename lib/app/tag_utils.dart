import 'package:flutter_research/app/modules/produc_detail/controllers/produc_detail_controller.dart';
import 'package:get/get.dart';

class TagUtils {
  static final TagUtils _instance =  TagUtils._internal();

  factory TagUtils() {
    return _instance;
  }

  TagUtils._internal();

  List<String> tagsProductDetail = [];

  ProducDetailController? findProductDetailController() {
    ProducDetailController? _controller;
    for (var i = 0; i < tagsProductDetail.length; i++) {
      try {
        _controller = Get.find<ProducDetailController>(tag: tagsProductDetail[i]);
      } catch (e) {
        continue;
      }
    }

    return _controller;
  }
}
