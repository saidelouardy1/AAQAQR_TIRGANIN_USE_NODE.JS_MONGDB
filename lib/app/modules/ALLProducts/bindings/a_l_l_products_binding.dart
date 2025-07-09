import 'package:get/get.dart';

import '../controllers/a_l_l_products_controller.dart';

class ALLProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ALLProductsController>(
      () => ALLProductsController(),
    );
  }
}
