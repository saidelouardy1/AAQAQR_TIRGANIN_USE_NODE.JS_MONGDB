import 'package:get/get.dart';

import '../modules/Authentication/bindings/authentication_binding.dart';
import '../modules/Authentication/views/authentication_view.dart';
import '../modules/HomeStaffScreen/bindings/home_staff_screen_binding.dart';
import '../modules/HomeStaffScreen/views/home_staff_screen_view.dart';
import '../modules/NavigatorBar/bindings/navigator_bar_binding.dart';
import '../modules/NavigatorBar/views/navigator_bar_view.dart';
import '../modules/NavigatorBarStaff/bindings/navigator_bar_staff_binding.dart';
import '../modules/NavigatorBarStaff/views/navigator_bar_staff_view.dart';
import '../modules/OnboardingScreen/bindings/onboarding_screen_binding.dart';
import '../modules/OnboardingScreen/pages/role_selection_screen.dart';
import '../modules/OnboardingScreen/views/onboarding_screen_view.dart';
import '../modules/SplashScreen/bindings/splash_screen_binding.dart';
import '../modules/SplashScreen/views/splash_screen_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING_SCREEN,
      page: () => const OnboardingScreenView(),
      binding: OnboardingScreenBinding(),
    ),
    GetPage(
      name: _Paths.ROLESELECATIONSCREEN,
      page: () => const RoleselectionScreen(),
      binding: OnboardingScreenBinding(),
    ),
    GetPage(
      name: _Paths.AUTHENTICATION,
      page: () => const AuthenticationView(),
      binding: AuthenticationBinding(),
    ),
    GetPage(
      name: _Paths.HOME_STAFF_SCREEN,
      page: () => const HomeStaffScreenView(),
      binding: HomeStaffScreenBinding(),
    ),
    GetPage(
      name: _Paths.NAVIGATOR_BAR,
      page: () => const NavigatorBarView(),
      binding: NavigatorBarBinding(),
    ),
    GetPage(
      name: _Paths.NAVIGATOR_BAR_STAFF,
      page: () => const NavigatorBarStaffView(),
      binding: NavigatorBarStaffBinding(),
    ),
  ];
}
