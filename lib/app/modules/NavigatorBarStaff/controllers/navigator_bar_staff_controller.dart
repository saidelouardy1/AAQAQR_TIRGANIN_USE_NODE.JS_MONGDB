import 'package:aaqaqir_tirganin/app/modules/ALLProducts/views/a_l_l_products_view.dart';
import 'package:aaqaqir_tirganin/app/modules/HomeStaffScreen/views/home_staff_screen_view.dart';
import 'package:aaqaqir_tirganin/app/modules/PrintInvoice/views/print_invoice_view.dart';
import 'package:aaqaqir_tirganin/app/modules/SettingStaff/views/setting_staff_view.dart';
import 'package:get/get.dart';
import 'package:sidebarx/sidebarx.dart';

class NavigatorBarStaffController extends GetxController {
  
/////////////////////////////////////////////// statement
late SidebarXController sidebarController;
 RxInt selectedIndex = 0.obs;
 RxList pages = [
      HomeStaffScreenView(),
      ALLProductsView(),
      PrintInvoiceView(),
      SettingStaffView(),
    ].obs;

////////////////////////////////////////////: method

 void changePage(int index){
  selectedIndex.value = index;
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
