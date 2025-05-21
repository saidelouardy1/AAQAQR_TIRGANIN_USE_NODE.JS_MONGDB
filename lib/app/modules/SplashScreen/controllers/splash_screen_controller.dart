import 'dart:async';

import 'package:aaqaqir_tirganin/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  
  

  MoveToNextPage() {
    Timer(Duration(seconds: 2), () {
      Get.offAllNamed(Routes.ONBOARDING_SCREEN);
    });
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    MoveToNextPage();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
