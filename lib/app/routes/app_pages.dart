import 'package:get/get.dart';

import '../modules/ALLProducts/bindings/a_l_l_products_binding.dart';
import '../modules/ALLProducts/views/a_l_l_products_view.dart';
import '../modules/Authentication/bindings/authentication_binding.dart';
import '../modules/Authentication/views/authentication_view.dart';
import '../modules/HomeAdmin/bindings/home_admin_binding.dart';
import '../modules/HomeAdmin/views/home_admin_view.dart';
import '../modules/HomeStaffScreen/bindings/home_staff_screen_binding.dart';
import '../modules/HomeStaffScreen/views/home_staff_screen_view.dart';
import '../modules/NavigatorBarAdimn/bindings/navigator_bar_adimn_binding.dart';
import '../modules/NavigatorBarAdimn/views/navigator_bar_adimn_view.dart';
import '../modules/NavigatorBarStaff/bindings/navigator_bar_staff_binding.dart';
import '../modules/NavigatorBarStaff/views/navigator_bar_staff_view.dart';
import '../modules/OnboardingScreen/bindings/onboarding_screen_binding.dart';
import '../modules/OnboardingScreen/pages/role_selection_screen.dart';
import '../modules/OnboardingScreen/views/onboarding_screen_view.dart';
import '../modules/PrintInvoice/bindings/print_invoice_binding.dart';
import '../modules/PrintInvoice/views/print_invoice_view.dart';
import '../modules/SettingStaff/bindings/setting_staff_binding.dart';
import '../modules/SettingStaff/views/setting_staff_view.dart';
import '../modules/SplashScreen/bindings/splash_screen_binding.dart';
import '../modules/SplashScreen/views/splash_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
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
      name: _Paths.NAVIGATOR_BAR_STAFF,
      page: () => const NavigatorBarStaffView(),
      binding: NavigatorBarStaffBinding(),
    ),
    GetPage(
      name: _Paths.A_L_L_PRODUCTS,
      page: () => const ALLProductsView(),
      binding: ALLProductsBinding(),
    ),
    GetPage(
      name: _Paths.PRINT_INVOICE,
      page: () => const PrintInvoiceView(),
      binding: PrintInvoiceBinding(),
    ),
    GetPage(
      name: _Paths.SETTING_STAFF,
      page: () => const SettingStaffView(),
      binding: SettingStaffBinding(),
    ),
    GetPage(
      name: _Paths.HOME_ADMIN,
      page: () => const HomeAdminView(),
      binding: HomeAdminBinding(),
    ),
    GetPage(
      name: _Paths.NAVIGATOR_BAR_ADIMN,
      page: () => const NavigatorBarAdimnView(),
      binding: NavigatorBarAdimnBinding(),
    ),
  ];
}
