import 'package:get/get.dart';

import '../controllers/forgotpasswordscreen_controller.dart';

class ForgotpasswordscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotpasswordscreenController>(
      () => ForgotpasswordscreenController(),
    );
  }
}
