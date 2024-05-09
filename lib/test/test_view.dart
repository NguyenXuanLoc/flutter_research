import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_research/tag_controller.dart';
import 'package:flutter_research/test/test_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../main.dart';

class TestView extends StatelessWidget {
  var controller = TagController().findDetailOrderController();

  TestView({super.key});

  @override
  Widget build(BuildContext context) {
    controller?.increase();
    return Scaffold(
        body: Center(
      child: InkWell(
        child: Obx(() => Text("TAG CLICK: ${controller?.test.value}")),
        onTap: () {
          Get.toNamed("/test", preventDuplicates: false);
          print("TAG ON CLICK");
/*          Get.to(TestView(), binding: BindingsBuilder(() {
            print("TAG BindingsBuilder");
          }), id: 11);*/
        },
      ),
    ));
  }
}
