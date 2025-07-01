import 'package:get/get.dart';

import '../controllers/home_staff_screen_controller.dart';

class HomeStaffScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeStaffScreenController>(
      () => HomeStaffScreenController(),
    );
  }
}
