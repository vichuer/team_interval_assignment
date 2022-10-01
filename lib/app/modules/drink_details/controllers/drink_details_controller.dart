import 'dart:developer';

import 'package:get/get.dart';

class DrinkDetailsController extends GetxController {
  var details = Get.arguments;
  var parameters = Get.parameters;
  @override
  void onInit() {
    log(details['strAlcoholic'].toString());
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
