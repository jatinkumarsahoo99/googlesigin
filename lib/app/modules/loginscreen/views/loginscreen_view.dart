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
import '../../registrationscreen/model/GoogleSignInModel.dart';
import '../controllers/loginscreen_controller.dart';

class LoginscreenView extends GetView<LoginscreenController> {
  LoginscreenView({Key? key}) : super(key: key);

  @override
  LoginscreenController controller = Get.find<LoginscreenController>();

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
            CommonAppbarView(
              iconData: Icons.arrow_back,
              titleText: "LogIn",
              onBackClick: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    GetBuilder<LoginscreenController>(
                        id: "allField",
                        builder: (controller) {
                          return Column(
                            children: [
                              CommTextFormField(
                                controller: controller.emailController,
                                errorText: controller.errorEmail,
                                titleText: "Your email",
                                padding: const EdgeInsets.only(
                                    left: 24, right: 24, bottom: 16),
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
                                    left: 24, right: 24),
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


                    _forgotYourPasswordUI(),
                    Obx(() {
                      return CommonButton(
                          padding: const EdgeInsets.only(
                              left: 24, right: 24, bottom: 3),
                          buttonText: "Login",
                          isEnable: controller.isBtnEnable.value,
                          onTap: () {
                            controller.googleSignInResponse =
                                GoogleSignInResponse(
                                    email: controller.emailController.text);
                            controller.setData();
                          }
                      );
                    }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Don't have account?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Theme
                                .of(context)
                                .disabledColor,
                          ),
                        ),
                        InkWell(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(8)),
                          onTap: () {
                            Get.toNamed(Routes.REGISTRATIONSCREEN);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              "Sign In",
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

                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "or log in with social media",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Theme
                              .of(context)
                              .disabledColor,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 32),
                      child: FacebookTwitterButtonView(onFaceBookTap: () {
                        Get.snackbar("Alert", "Functionality not available",
                            snackPosition: SnackPosition.BOTTOM);
                      },
                        onGoogleTap: () {
                          controller.handleGoogleSignIn();
                        },
                        onTwitterTap: () {
                          Get.snackbar("Alert", "Functionality not available",
                              snackPosition: SnackPosition.BOTTOM);
                        },),
                    ),


                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _forgotYourPasswordUI() {
    return Padding(
      padding: const EdgeInsets.only(top: 8, right: 16, bottom: 8, left: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            onTap: () {

              Get.toNamed(Routes.FORGOTPASSWORDSCREEN);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Forgot your Password?",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Theme
                      .of(Get.context!)
                      .disabledColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


}
