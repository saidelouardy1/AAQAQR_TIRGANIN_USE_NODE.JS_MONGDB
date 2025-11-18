import 'package:get/get.dart';

import '../controllers/category_products_view_admin_controller.dart';

class CategoryProductsViewAdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryProductsViewAdminController>(
      () => CategoryProductsViewAdminController(),
    );
  }
}
