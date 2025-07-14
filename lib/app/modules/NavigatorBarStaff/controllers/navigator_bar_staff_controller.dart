import 'package:aaqaqir_tirganin/app/modules/ALLProducts/controllers/a_l_l_products_controller.dart';
import 'package:aaqaqir_tirganin/app/modules/ALLProducts/views/a_l_l_products_view.dart';
import 'package:aaqaqir_tirganin/app/modules/HomeStaffScreen/controllers/home_staff_screen_controller.dart';
import 'package:aaqaqir_tirganin/app/modules/HomeStaffScreen/views/home_staff_screen_view.dart';
import 'package:aaqaqir_tirganin/app/modules/PrintInvoice/controllers/print_invoice_controller.dart';
import 'package:aaqaqir_tirganin/app/modules/PrintInvoice/views/print_invoice_view.dart';
import 'package:aaqaqir_tirganin/app/modules/SettingStaff/controllers/setting_staff_controller.dart';
import 'package:aaqaqir_tirganin/app/modules/SettingStaff/views/setting_staff_view.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sidebarx/sidebarx.dart';

class NavigatorBarStaffController extends GetxController {
  /////////////////////////////////////////////// statement
  late SidebarXController sidebarController;
  RxInt selectedIndex = 0.obs;

  ////////////////////////////////////////////: method

  void SelectIndex(int index) {
    selectedIndex.value = index;
  }

  Widget Changepage(int index) {
    switch (index) {
      case 0:
        Get.put(HomeStaffScreenController());
        return HomeStaffScreenView();
      case 1:
        Get.put(ALLProductsController());
        return ALLProductsView();
      case 2:
        Get.put(PrintInvoiceController());
        return PrintInvoiceView();
      case 3:
        Get.put(SettingStaffController());
        return SettingStaffView();
      default:
        Get.put(HomeStaffScreenController());
        return HomeStaffScreenView();
    }
  }

  @override
  void onInit() {
    super.onInit();
    sidebarController = SidebarXController(
      selectedIndex: selectedIndex.value,
      extended: true,
    );
    ever(selectedIndex, (index) {
      sidebarController.selectIndex(index);
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
