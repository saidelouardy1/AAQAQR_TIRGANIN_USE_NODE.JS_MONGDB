import 'package:get/get.dart';

import '../controllers/products_view_admin_controller.dart';

class ProductsViewAdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductsViewAdminController>(
      () => ProductsViewAdminController(),
    );
  }
}
