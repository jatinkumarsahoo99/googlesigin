import 'package:get/get.dart';

import '../modules/dashboardscreen/bindings/dashboardscreen_binding.dart';
import '../modules/dashboardscreen/views/dashboardscreen_view.dart';
import '../modules/forgotpasswordscreen/bindings/forgotpasswordscreen_binding.dart';
import '../modules/forgotpasswordscreen/views/forgotpasswordscreen_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/loginscreen/bindings/loginscreen_binding.dart';
import '../modules/loginscreen/views/loginscreen_view.dart';
import '../modules/registrationscreen/bindings/registrationscreen_binding.dart';
import '../modules/registrationscreen/views/registrationscreen_view.dart';
import '../modules/splashscreen/bindings/splashscreen_binding.dart';
import '../modules/splashscreen/views/splashscreen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASHSCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGINSCREEN,
      page: () => LoginscreenView(),
      binding: LoginscreenBinding(),
    ),
    GetPage(
      name: _Paths.REGISTRATIONSCREEN,
      page: () => RegistrationscreenView(),
      binding: RegistrationscreenBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARDSCREEN,
      page: () =>  DashboardscreenView(),
      binding: DashboardscreenBinding(),
    ),
    GetPage(
      name: _Paths.FORGOTPASSWORDSCREEN,
      page: () =>  ForgotpasswordscreenView(),
      binding: ForgotpasswordscreenBinding(),
    ),
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () =>  SplashscreenView(),
      binding: SplashscreenBinding(),
    ),
  ];
}
