import 'package:get/get.dart';

import '../controllers/products_view_controller.dart';

class ProductsViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductsViewController>(
      () => ProductsViewController(),
    );
  }
}
