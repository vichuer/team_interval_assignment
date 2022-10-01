import 'dart:async';

import 'package:get/get.dart';

class SplashController extends GetxController {
  final count = 0.obs;
  @override
  void onInit() {
    Future.delayed(Duration(milliseconds: 3000))
        .then((value) => Get.offNamedUntil('login', (route) => false));
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
