import 'package:get/get.dart';

import '../controllers/drink_details_controller.dart';

class DrinkDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DrinkDetailsController>(
      () => DrinkDetailsController(),
    );
  }
}
