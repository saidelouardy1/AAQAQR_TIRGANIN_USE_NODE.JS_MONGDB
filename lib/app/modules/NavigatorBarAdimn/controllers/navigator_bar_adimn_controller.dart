import 'package:aaqaqir_tirganin/app/modules/AdminSettings/controllers/admin_settings_controller.dart';
import 'package:aaqaqir_tirganin/app/modules/AdminSettings/views/admin_settings_view.dart';
import 'package:aaqaqir_tirganin/app/modules/HomeAdmin/controllers/home_admin_controller.dart';
import 'package:aaqaqir_tirganin/app/modules/HomeAdmin/views/home_admin_view.dart';
import 'package:aaqaqir_tirganin/app/modules/StoreManagement/controllers/store_management_controller.dart';
import 'package:aaqaqir_tirganin/app/modules/StoreManagement/views/store_management_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sidebarx/sidebarx.dart';

class NavigatorBarAdimnController extends GetxController {
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
        Get.put(HomeAdminController());
        return HomeAdminView();
      case 1:
        Get.put(StoreManagementController());
        return StoreManagementView();
      case 2:
        Get.put(AdminSettingsController());
        return AdminSettingsView();
      default:
        Get.put(HomeAdminController());
        return HomeAdminView();
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
