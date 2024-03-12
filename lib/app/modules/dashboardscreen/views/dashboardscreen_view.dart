import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../AppTheme/text_styles.dart';
import '../../../commonWidgets/common_appbar_view.dart';
import '../../../commonWidgets/common_button.dart';
import '../../../commonWidgets/remove_focuse.dart';
import '../controllers/dashboardscreen_controller.dart';

class DashboardscreenView extends GetView<DashboardscreenController> {
  DashboardscreenView({Key? key}) : super(key: key);

  @override
  DashboardscreenController controller = Get.find<DashboardscreenController>();

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
              titleText: "User Details",
              onBackClick: () {
                Navigator.pop(context);
              },
            ),
            Expanded(
                child: GetBuilder<DashboardscreenController>(
                    id: "refresh",
                    builder: (controller) {
                      return Container(
                        child: SingleChildScrollView(
                          child: (controller.googleSignInResponse != null)
                              ? Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Card(
                                        color: Colors.orange.withOpacity(0.4),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: SizedBox(
                                                        height:
                                                            Get.height * 0.17,
                                                        width: Get.width * 0.3,
                                                        child: Image.network(
                                                          controller
                                                                  .googleSignInResponse
                                                                  ?.url ??
                                                              "",
                                                          errorBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  Object error,
                                                                  StackTrace?
                                                                      stackTrace) {
                                                            return Center(
                                                              child: Icon(
                                                                  Icons.error),
                                                            );
                                                          },
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      ListTile(
                                                        title: Text("Name",
                                                            style: TextStyles(
                                                                    context)
                                                                .getBoldStyle()),
                                                        contentPadding:
                                                            EdgeInsets.all(2),
                                                        minVerticalPadding: 1,
                                                        subtitle: Text(
                                                            controller
                                                                    .googleSignInResponse
                                                                    ?.name ??
                                                                "XXXXXXXXXXXX",
                                                            style: TextStyles(
                                                                    context)
                                                                .getRegularStyle()),
                                                      ),
                                                      ListTile(
                                                        title: Text(
                                                            "Last Login",
                                                            style: TextStyles(
                                                                    context)
                                                                .getBoldStyle()),
                                                        contentPadding:
                                                            EdgeInsets.all(2),
                                                        minVerticalPadding: 1,
                                                        subtitle: Text(
                                                            controller
                                                                    .googleSignInResponse
                                                                    ?.lastLogInTime ??
                                                                "XXXXXXXXXXXXXX",
                                                            style: TextStyles(
                                                                    context)
                                                                .getRegularStyle()),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                                controller.googleSignInResponse
                                                        ?.email ??
                                                    "XXXXXXXXXXXXXX",
                                                style: TextStyles(context)
                                                    .getRegularStyle()),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: Get.height*0.4,
                                    ),
                                    CommonButton(
                                        padding: const EdgeInsets.only(
                                            left: 24, right: 24, bottom: 16),
                                        buttonText: "Log Out",
                                        onTap: () {
                                          controller.gotoSplashScreen();
                                        }),
                                  ],
                                )
                              : Container(
                                  child: Center(
                                      child: CircularProgressIndicator()),
                                ),
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
