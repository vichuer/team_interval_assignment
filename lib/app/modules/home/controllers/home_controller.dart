import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:team_interval_assignment/app/modules/home/drinks_model.dart';
import 'package:team_interval_assignment/widgets/loader.dart';

class HomeController extends GetxController {
  TextEditingController searchController = TextEditingController();
  var drinks = Drinks().obs;
  var json = [];

  @override
  void onInit() {
    fetchDrinks('rum');
    super.onInit();
  }

  Future<void> fetchDrinks(String keyword) async {
    log('calling the fucnction: ');

    String url = 'https://www.thecocktaildb.com/api/json/v1/1/search.php';
    Future.delayed(Duration(milliseconds: 150))
        .then((value) => Get.dialog(Loader()));

    await http.post(Uri.parse(url), body: {'s': keyword}).then((response) {
      if (response.statusCode == 200) {
        String data = response.body;
        log(data);
        var json = jsonDecode(data);
        drinks.value = Drinks.fromJson(json);
        Get.back();
      } else {
        Get.back();
        Get.snackbar('Server Error', 'Please try again later',
            backgroundColor: Colors.red, snackPosition: SnackPosition.BOTTOM);
      }
    });
  }
}
