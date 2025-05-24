import 'package:get/get.dart';

class OnboardingScreenController extends GetxController {

   RxList<bool> isHovering = <bool>[false, false].obs;
   RxBool isHoveringSingle = false.obs;



   

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
