import 'package:flutter_research/app/tag_utils.dart';
import 'package:get/get.dart';

import '../controllers/produc_detail_controller.dart';

class ProducDetailBinding extends Bindings {
  @override
  void dependencies() {
    var tag = ProducDetailController().tag;
    TagUtils().tagsProductDetail.add(tag);
    Get.lazyPut<ProducDetailController>(
      () => ProducDetailController(),tag: tag
    );
  }
}
