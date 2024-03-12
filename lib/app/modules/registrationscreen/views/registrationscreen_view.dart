import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../AppTheme/text_styles.dart';
import '../../../AppTheme/themes.dart';
import '../../../commonWidgets/commonTextField.dart';
import '../../../commonWidgets/common_appbar_view.dart';
import '../../../commonWidgets/common_button.dart';
import '../../../commonWidgets/common_text_field_view.dart';
import '../../../commonWidgets/facebook_twitter_button_view.dart';
import '../../../commonWidgets/remove_focuse.dart';
import '../../../routes/app_pages.dart';
import '../controllers/registrationscreen_controller.dart';

class RegistrationscreenView extends GetView<RegistrationscreenController> {
  RegistrationscreenView({Key? key}) : super(key: key);

  @override
  RegistrationscreenController controller =
      Get.find<RegistrationscreenController>();

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
            _appBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 18,
                    ),
                    GetBuilder<RegistrationscreenController>(
                        id: "allField",
                        builder: (controller) {
                          return Column(
                            children: [
                              CommTextFormField(
                                controller: controller.fnameController,
                                errorText: controller.errorFName,
                                padding: const EdgeInsets.only(
                                    bottom: 5, left: 24, right: 24),
                                titleText: "Name",
                                hintText: "Enter your name",
                                keyboardType: TextInputType.name,
                                onChanged: (String txt) {
                                  if (controller.allValidation()) {
                                    controller.isBtnEnable.value = true;
                                    controller.isBtnEnable.refresh();
                                  } else {
                                    controller.isBtnEnable.value = false;
                                    controller.isBtnEnable.refresh();
                                  }
                                },
                              ),
                              CommTextFormField(
                                controller: controller.emailController,
                                errorText: controller.errorEmail,
                                titleText: "Your email",
                                padding: const EdgeInsets.only(
                                    left: 24, right: 24, bottom: 5),
                                hintText: "enter your email",
                                keyboardType: TextInputType.emailAddress,
                                onChanged: (String txt) {
                                  if (controller.allValidation()) {
                                    controller.isBtnEnable.value = true;
                                    controller.isBtnEnable.refresh();
                                  } else {
                                    controller.isBtnEnable.value = false;
                                    controller.isBtnEnable.refresh();
                                  }
                                },
                              ),
                              CommTextFieldPassword(
                                titleText: "Password",
                                padding: const EdgeInsets.only(
                                    left: 24, right: 24, bottom: 24),
                                hintText: "enter password",
                                isAllowTopTitleView: true,
                                onChanged: (String txt) {
                                  if (controller.allValidation()) {
                                    controller.isBtnEnable.value = true;
                                    controller.isBtnEnable.refresh();
                                  } else {
                                    controller.isBtnEnable.value = false;
                                    controller.isBtnEnable.refresh();
                                  }
                                },
                                errorText: controller.errorPassword,
                                controller: controller.passwordController,
                              ),
                            ],
                          );
                        }),
                    Obx(() {
                      return CommonButton(
                        padding: const EdgeInsets.only(
                            left: 24, right: 24, bottom: 5),
                        buttonText: "Sign up",
                        isEnable: controller.isBtnEnable.value,
                        onTap: () {
                          if (controller.allValidation()) {
                            Get.toNamed(Routes.LOGINSCREEN);
                          }
                        },
                      );
                    }),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "or log in with social media",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).disabledColor,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 22),
                      child: FacebookTwitterButtonView(
                        onFaceBookTap: () {
                          Get.snackbar("Alert", "Functionality not available",snackPosition:SnackPosition.BOTTOM );
                        },
                        onGoogleTap: () {
                          controller.handleGoogleSignIn();
                        },
                        onTwitterTap: () {
                          Get.snackbar("Alert", "Functionality not available",snackPosition:SnackPosition.BOTTOM );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "By Signing up,you agreed with our terms of\n Services and privacy policy",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).disabledColor,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Already have account? Log in",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).disabledColor,
                          ),
                        ),
                        InkWell(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                          onTap: () {
                            Get.toNamed(Routes.LOGINSCREEN);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              "Login",
                              style: TextStyles(context)
                                  .getRegularStyle()
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppTheme.primaryColor,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).padding.bottom + 24,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _appBar() {
    return CommonAppbarView(
      iconData: Icons.arrow_back,
      titleText: "Sign up",
      onBackClick: () {
        Get.back();
      },
    );
  }
}
