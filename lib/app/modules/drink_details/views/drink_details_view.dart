import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/drink_details_controller.dart';

class DrinkDetailsView extends GetView<DrinkDetailsController> {
  final DrinkDetailsController controller = Get.put(DrinkDetailsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        floatingActionButton: FloatingActionButton.small(
          onPressed: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  Hero(
                    tag: controller.parameters['index']!,
                    child: CachedNetworkImage(
                      imageUrl: controller.details['strDrinkThumb'],
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                            Colors.black,
                            Colors.black45,
                            Colors.transparent,
                          ])),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                flex: 3,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: ListTile(
                            title: Text(
                              controller.details['strDrink'],
                              style: TextStyle(
                                  color: Colors.lightGreen,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                            subtitle: Text(
                              controller.details['strCategory'],
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                            trailing: Chip(
                              label: Text(controller.details['strGlass']),
                            ),
                          ))
                        ],
                      ),
                      ListTile(
                        title: Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            'Ingredients',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        subtitle: Column(
                          children: [
                            for (var i = 0; i < 10; i++)
                              Ingredients(
                                text: controller.details[
                                    'strIngredient' + (i + 1).toString()],
                                measure: controller
                                    .details['strMeasure' + (i + 1).toString()],
                              ),
                          ],
                        ),
                      ),
                      Divider(),
                      ListTile(
                        title: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            'Instructions',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        subtitle: Text(
                          controller.details['strInstructions'],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ));
  }
}

class Ingredients extends StatelessWidget {
  final String? text;
  final String? measure;

  const Ingredients({super.key, this.text, this.measure});

  @override
  Widget build(BuildContext context) {
    return text == null
        ? Container()
        : Row(
            children: [
              Icon(
                Icons.circle,
                color: Colors.white,
                size: 10,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                text!,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              Expanded(
                child: Text(
                  measure!,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              )
            ],
          );
  }
}
