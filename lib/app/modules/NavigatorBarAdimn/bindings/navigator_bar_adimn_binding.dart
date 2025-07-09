import 'package:get/get.dart';

import '../controllers/navigator_bar_adimn_controller.dart';

class NavigatorBarAdimnBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigatorBarAdimnController>(
      () => NavigatorBarAdimnController(),
    );
  }
}
