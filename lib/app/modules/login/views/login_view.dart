import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:team_interval_assignment/widgets/custom_textfield.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/bg.webp',
                    ),
                    colorFilter:
                        ColorFilter.mode(Colors.black45, BlendMode.darken)),
              ),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Welcome',
                        style:
                            TextStyle(fontSize: 34, color: Colors.lightGreen),
                      ),
                      Text(
                        'Sign in to continue',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomTextField(
                        hint: 'Mobile',
                        iconData: Icons.phone_android,
                        controller: controller.unameController,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Obx(
                        () => CustomTextField(
                          hint: 'Password',
                          iconData: Icons.lock,
                          controller: controller.passController,
                          isObscure: true,
                          isVisible: controller.isVisible.value,
                          toggleVisibility: () {
                            controller.toggleVisibility();
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(child: SizedBox()),
                          Expanded(
                            child: SizedBox(
                                height: 45,
                                child: ElevatedButton(
                                    onPressed: () {
                                      controller.login();
                                    },
                                    child: Text('LOGIN'))),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(),
                ],
              ),
            ),
          ],
        ));
  }
}
