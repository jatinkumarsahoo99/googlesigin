import 'dart:async';

import 'package:get/get.dart';

import '../../../provider/shared_preferences_keys.dart';
import '../../../routes/app_pages.dart';

class SplashscreenController extends GetxController {
  //TODO: Implement SplashscreenController

  final count = 0.obs;

  getLoginDetails() async {
    String? isLogin = await SharedPreferencesKeys().getStringData(key: 'isLogin');
    if(isLogin == "true"){
      Get.offAndToNamed(Routes.DASHBOARDSCREEN);
    }else{
      Get.offAndToNamed(Routes.LOGINSCREEN);
    }
  }
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 2),() {
      getLoginDetails();
    },);
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
