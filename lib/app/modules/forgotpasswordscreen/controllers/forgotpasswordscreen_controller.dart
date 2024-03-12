import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Utils/validator.dart';

class ForgotpasswordscreenController extends GetxController {
  //TODO: Implement ForgotpasswordscreenController

  final count = 0.obs;

  String errorEmail = '';
  final TextEditingController emailController = TextEditingController();
  Rx<bool> isBtnEnable = Rx<bool>(false);

  bool allValidation() {
    bool isValid = true;
    if (emailController.text.trim().isEmpty) {
      errorEmail = "email can not be empty";
      isValid = false;
    } else if (!Validator.isEmailValid(emailController.text.trim())) {
      errorEmail = "please enter valid email";
      isValid = false;
    } else {
      errorEmail = '';
    }

    update(['allField']);
    return isValid;
  }

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

  void increment() => count.value++;
}
