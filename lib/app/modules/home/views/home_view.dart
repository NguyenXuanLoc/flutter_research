import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: InkWell(child: Text(
          'HomeView is working',
          style: TextStyle(fontSize: 20),
        ),onTap: ()=>Get.toNamed(Routes.PRODUC_DETAIL),),
      ),
    );
  }
}
