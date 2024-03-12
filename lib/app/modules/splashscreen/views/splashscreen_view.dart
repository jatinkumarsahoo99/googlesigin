import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../commonWidgets/common_appbar_view.dart';
import '../../../commonWidgets/remove_focuse.dart';
import '../controllers/splashscreen_controller.dart';

class SplashscreenView extends GetView<SplashscreenController> {
   SplashscreenView({Key? key}) : super(key: key);

  @override
  SplashscreenController controller = Get.find<SplashscreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RemoveFocuse(
        onClick: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(
                child: Image.asset("assets/images/logo.png"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
