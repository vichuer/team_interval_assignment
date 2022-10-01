import 'dart:developer';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:team_interval_assignment/widgets/custom_textfield.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Row(
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 30,
              ),
              SizedBox(
                width: 10,
              ),
              Text('Cocktail Hub'),
            ],
          ),
          backgroundColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                        hint: 'Search',
                        iconData: Icons.search,
                        controller: controller.searchController),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (controller.searchController.text.isNotEmpty) {
                          controller
                              .fetchDrinks(controller.searchController.text);
                        }
                      },
                      child: Icon(Icons.search),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Obx(
                  () => GridView.builder(
                    padding: EdgeInsets.only(top: 10),
                    itemCount: controller.drinks.value.drinks == null
                        ? 0
                        : controller.drinks.value.drinks!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 0.9),
                    itemBuilder: ((context, index) => GestureDetector(
                          onTap: () {
                            Get.toNamed('drink-details',
                                arguments: controller
                                    .drinks.value.drinks![index]
                                    .toJson(),
                                parameters: {'index': index.toString()});
                          },
                          child: Card(
                            color: Colors.black,
                            child: Stack(
                              children: [
                                Center(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Hero(
                                      tag: index.toString(),
                                      child: CachedNetworkImage(
                                        imageUrl: controller.drinks.value
                                            .drinks![index].strDrinkThumb!,
                                        height: 220,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: ClipRRect(
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 5, sigmaY: 5),
                                      child: Container(
                                        color: Colors.black54,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                controller.drinks.value
                                                    .drinks![index].strDrink!,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                controller
                                                    .drinks
                                                    .value
                                                    .drinks![index]
                                                    .strCategory!,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
