import 'package:flutter/material.dart';
import 'package:flutter_research/app/tag_utils.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/produc_detail_controller.dart';

class ProducDetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _controller = TagUtils().findProductDetailController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Issue 1481'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
                  () => Text('${_controller?.randomNumer.value}'),
            ),
            TextButton(
              onPressed: () {
                Get.toNamed(Routes.PRODUC_DETAIL, preventDuplicates: false);
              },
              child: Text('Navigate to issue_1481 again'),
            ),
          ],
        ),
      ),
    );
  }
}
