import 'package:get/get.dart';

import '../controllers/setting_staff_controller.dart';

class SettingStaffBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingStaffController>(
      () => SettingStaffController(),
    );
  }
}
