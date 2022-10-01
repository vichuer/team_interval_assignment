import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Loader extends StatefulWidget {
  const Loader({
    Key? key,
  }) : super(key: key);

  @override
  State<Loader> createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: Center(child: CircularProgressIndicator()),
    );
  }

  Future<void> navigate(int from) async {
    Get.back();
    switch (from) {
      case 1:
        // Get.to(() => Customers());
        break;
      case 2:
        //  Get.to(() => AddCustomers());
        break;
      case 3:
        // Get.to(() => AddEvents());
        break;
      default:
        null;
    }
  }
}
