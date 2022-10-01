import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController unameController = TextEditingController();
  TextEditingController passController = TextEditingController();

  var isVisible = false.obs;

  String username = 'test123';
  String password = '123456';

  @override
  void onInit() {
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

  toggleVisibility() {
    log('TOOGLE FUNCTION');
    isVisible.value = !isVisible.value;
  }

  login() async {
    if (unameController.text.isEmpty) {
      Get.snackbar('Error', 'Enter Username',
          backgroundColor: Colors.red, snackPosition: SnackPosition.BOTTOM);
    } else if (passController.text.isEmpty) {
      Get.snackbar('Error', 'Enter Password',
          backgroundColor: Colors.red, snackPosition: SnackPosition.BOTTOM);
    }
    if (unameController.text != username) {
      Get.snackbar('Error', 'Invalid Username',
          backgroundColor: Colors.red, snackPosition: SnackPosition.BOTTOM);
    } else if (passController.text != password) {
      Get.snackbar('Error', 'Invalid Password',
          backgroundColor: Colors.red, snackPosition: SnackPosition.BOTTOM);
    } else {
      Get.snackbar('Welcome', 'Login Success',
          backgroundColor: Colors.green, snackPosition: SnackPosition.BOTTOM);
      Get.offNamed('home');
    }
  }
}
