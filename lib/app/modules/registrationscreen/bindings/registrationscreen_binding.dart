import 'package:get/get.dart';

import '../controllers/registrationscreen_controller.dart';

class RegistrationscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegistrationscreenController>(
      () => RegistrationscreenController(),
    );
  }
}
