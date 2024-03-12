import 'dart:convert';

import 'package:get/get.dart';
import 'package:google_login/app/data/helper.dart';

import '../../../provider/shared_preferences_keys.dart';
import '../../../routes/app_pages.dart';
import '../../registrationscreen/model/GoogleSignInModel.dart';

class DashboardscreenController extends GetxController with Helper {
  //TODO: Implement DashboardscreenController

  final count = 0.obs;
  GoogleSignInResponse? googleSignInResponse;
  getData() async {
    dynamic isLoginData = await SharedPreferencesKeys().getStringData(key: 'loginData');
    if(isLoginData != null && isLoginData != ""){
      googleSignInResponse = GoogleSignInResponse.fromJson(jsonDecode(isLoginData));
      print(">>>>>>>>>>>>>>>>>>>>>>>>>${(googleSignInResponse?.toJson())}");
      update(['refresh']);
    }
  }


  void gotoSplashScreen() async {
    bool isOk = await showCommonPopupNew(
      "Are you sure?",
      "You want to Sign Out.",
      Get.context!,
      barrierDismissible: true,
      isYesOrNoPopup: true,
    );
    if (isOk) {
      await SharedPreferencesKeys().setStringData(key: "login", text: "false");
      await SharedPreferencesKeys().setStringData(key: "loginData", text: "");
      Get.offAndToNamed(Routes.LOGINSCREEN);
      // ignore: use_build_context_synchronously
    }
  }


  @override
  void onInit() {
    getData();
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

  void increment() => count.value++;
}
