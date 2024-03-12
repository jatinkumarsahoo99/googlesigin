import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../commonWidgets/common_text_field_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body:  Center(
        child: Column(
          children: [
            InkWell(
              onTap:(){
                controller.handleGoogleSignIn();
              },
              child: Text(
                'HomeView is working',
                style: TextStyle(fontSize: 20),
              ),
            ),
            CommTextFormField(controller: TextEditingController(),)
          ],
        ),
      ),
    );
  }
}
