import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../commonWidgets/common_appbar_view.dart';
import '../../../commonWidgets/common_button.dart';
import '../../../commonWidgets/common_text_field_view.dart';
import '../../../commonWidgets/remove_focuse.dart';
import '../controllers/forgotpasswordscreen_controller.dart';

class ForgotpasswordscreenView extends GetView<ForgotpasswordscreenController> {
   ForgotpasswordscreenView({Key? key}) : super(key: key);

   @override
  ForgotpasswordscreenController controller = Get.find<ForgotpasswordscreenController>();

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
            appBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 16.0, bottom: 16.0, left: 24, right: 24),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "Enter your email to receive an email to reset your password",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Theme
                                    .of(context)
                                    .disabledColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    CommTextFormField(
                      controller: controller.emailController,
                      titleText: "Your email",
                      errorText: controller.errorEmail,
                      padding: const EdgeInsets.only(
                          left: 24, right: 24, bottom: 24),
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
                    Obx(() {
                      return CommonButton(
                        padding: const EdgeInsets.only(
                            left: 24, right: 24, bottom: 16),
                        buttonText: "Send",
                        isEnable: controller.isBtnEnable.value,
                        onTap: () {
                          if (controller.allValidation()) Get.back();
                        },
                      );
                    }),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget appBar() {
    return CommonAppbarView(
      iconData: Icons.arrow_back,
      titleText: "Forgot Password",
      onBackClick: () {
        Get.back();
      },
    );
  }

}
