import 'package:aaqaqir_tirganin/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreenController extends GetxController {
  RxList<String> ChooseLanguage = [ "Let’s use French" , "Let’s use English"].obs;
  RxList<String> ChooseRoles = [ "Admin" , "Staff"].obs;
   RxList<bool> isHovering = <bool>[false, false].obs;
   RxBool isHoveringSingle = false.obs;
   RxInt isSelect= (-1).obs;
   RxInt isSelectRoles= (-1).obs;
   RxInt initNumber = 0.obs;


   void toggleLanguage(int index) async {
    switch(index){
      case  0: Get.updateLocale(Locale("fr"));
      break;
      case  1: Get.updateLocale(Locale("en"));
      break;
      case  2: Get.updateLocale(Locale("ar"));
      break;
      default : Get.updateLocale(Locale("ar"));
      break;
    }
   }

   void toggleRoles(int index) async {
    switch(index){
      case  0: Get.offAllNamed(Routes.NAVIGATOR_BAR);
      break;
      case  1: Get.offAllNamed(Routes.NAVIGATOR_BAR_STAFF);
      break;
      default : Get.offAllNamed(Routes.NAVIGATOR_BAR);
      break;
    }
   }
 

  void onEnter(int index, bool hover) {
    isHovering[index] = hover;
  }
  void onEnterSingle(bool hover) {
    isHoveringSingle.value = hover;
  }


  @override
  void onInit() {
    super.onInit();
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
