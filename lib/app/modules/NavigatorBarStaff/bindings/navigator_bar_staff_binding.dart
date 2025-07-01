import 'package:get/get.dart';

import '../controllers/navigator_bar_staff_controller.dart';

class NavigatorBarStaffBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigatorBarStaffController>(
      () => NavigatorBarStaffController(),
    );
  }
}
