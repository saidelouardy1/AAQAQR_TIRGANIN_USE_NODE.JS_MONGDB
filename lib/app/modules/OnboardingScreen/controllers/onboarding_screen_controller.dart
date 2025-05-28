import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreenController extends GetxController {

   RxList<bool> isHovering = <bool>[false, false].obs;
   RxBool isHoveringSingle = false.obs;
   RxInt isSelect= (-1).obs;
   RxInt initNumber = 0.obs;


   void toggle(int index) async {
    switch(index){
      case  0: Get.updateLocale(Locale("fr"));
      break;
      case  1: Get.updateLocale(Locale("en"));
      break;
      case  2: Get.updateLocale(Locale("ar"));
      break;
    }
   }
 

  void onEnter(int index, bool hover) {
    isHovering[index] = hover;
  }
  void onEnterSingle(bool hover) {
    isHoveringSingle.value = hover;
  }

  RxList<String> ChooseLanguage = [ "Let’s use French" , "Let’s use English"].obs;
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
