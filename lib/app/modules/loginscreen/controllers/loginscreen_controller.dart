import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../Utils/validator.dart';
import '../../../provider/shared_preferences_keys.dart';
import '../../../routes/app_pages.dart';
import '../../registrationscreen/model/GoogleSignInModel.dart';

class LoginscreenController extends GetxController {
  //TODO: Implement LoginscreenController

  final count = 0.obs;

  String errorEmail = '';
  final TextEditingController emailController = TextEditingController();
  String errorPassword = '';
  final TextEditingController passwordController = TextEditingController();
  Rx<bool> isBtnEnable = Rx<bool>(false);

  bool allValidation() {
    bool isValid = true;

    print(">>>>>>>>>>>>fun call");

    if (emailController.text.trim().isEmpty) {
      errorEmail = "email can not be empty";
      isValid = false;
    } else if (!Validator.isEmailValid(emailController.text.trim())) {
      errorEmail = "please enter valid email";
      isValid = false;
    } else {
      errorEmail = '';
    }

    if (passwordController.text.trim().isEmpty) {
      errorPassword = "password can not be empty";
      isValid = false;
    } else if (!Validator.isPasswordValid(passwordController.text.trim())) {
      errorPassword = "Password should be one capital,One special character, One numerics and length should be 8 character";
      isValid = false;
    } else {
      errorPassword = '';
    }
    update(['allField']);
    return isValid;
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? _user;
  GoogleSignInResponse? googleSignInResponse;

  void handleGoogleSignIn() {
    try {
      GoogleAuthProvider _googleAuthProvider = GoogleAuthProvider();
      _auth.signInWithProvider(_googleAuthProvider);
    } catch (error) {
      print(error);
    }
  }

  setData() async {
    await SharedPreferencesKeys().setStringData(key: "login", text: "true");
    await SharedPreferencesKeys().setStringData(
        key: "loginData", text: jsonEncode(googleSignInResponse?.toJson()));
    Get.toNamed(Routes.DASHBOARDSCREEN);
  }

  @override
  void onInit() {
    _auth.authStateChanges().listen((event) {
      _user = event;
      print(">>>>>>>>>>>>>>>>>>user ${_user.toString()}");
      if (_user != null) {
        googleSignInResponse = GoogleSignInResponse(
            email: _user?.email,
            mob: _user?.phoneNumber,
            url: _user?.photoURL,
            name: _user?.displayName,
            lastLogInTime: (_user?.metadata.lastSignInTime).toString());
        setData();
      }
    });
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
