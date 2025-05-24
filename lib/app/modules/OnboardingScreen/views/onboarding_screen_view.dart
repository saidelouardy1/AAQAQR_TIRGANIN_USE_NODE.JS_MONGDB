import 'package:aaqaqir_tirganin/app/config/Fonts/fonts.dart';
import 'package:aaqaqir_tirganin/app/config/themes/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/onboarding_screen_controller.dart';

class OnboardingScreenView extends GetView<OnboardingScreenController> {
  const OnboardingScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    bool _isHovering = false;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: Get.width,
        height: Get.height,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Stack(
          children: [
            /// text tirganin
            Text(
              "AAQAQIR_TIRGANIN".tr,
              textAlign: TextAlign.right,
              style: GoogleFonts.pacifico(
                color: Colors.black,
                fontSize: Fonts.headlineMedium,
                fontWeight: FontWeight.w600,
              ),
            ),
            //// widget in senter for choose the language
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ///////////...... text
                  Text(
                    "What language do you prefer?".tr,
                    textAlign: TextAlign.right,
                    style: GoogleFonts.merriweather(
                      color: Colors.black,
                      fontSize: Fonts.displayLarge,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  ///// box
                  SizedBox(height: 30),
                  //////////////.........; container
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: List.generate(
                      2,
                      (index) => IntrinsicWidth(
                        child: MouseRegion(
                          onEnter: (_) => controller.onEnter(index, true),
                          onExit: (_) => controller.onEnter(index, false),
                          child: Obx(
                            () => AnimatedContainer(
                              duration: Duration(milliseconds: 200),
                              curve: Curves.easeInOut,
                              height: Get.height / 4,
                              width: Get.width/6,
                              margin: EdgeInsets.all(20),
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color:  controller.isHovering[index] 
                                 ?ColorsApp.WhiteSmoke:  Colors.white,
                                border: Border.all(
                                  color:  controller.isHovering[index] 
                                  ? Colors.black : Colors.black38,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Icon(Icons.person),
                                      Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color:  Colors.black,
                                            width: 0.5,
                                          ),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Text(
                                      "Let’s use Arabic".tr,
                                      textAlign: TextAlign.right,
                                      style: GoogleFonts.robotoCondensed(
                                        color: Colors.black,
                                        fontSize: Fonts.displayLarge,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  SizedBox(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  IntrinsicWidth(
                        child: MouseRegion(
                          onEnter: (_) => controller.onEnterSingle(true),
                          onExit: (_) => controller.onEnterSingle(false),
                          child: Obx(
                            () => AnimatedContainer(
                              duration: Duration(milliseconds: 200),
                              curve: Curves.easeInOut,
                              height: Get.height / 4,
                              width: Get.width/6,
                              margin: EdgeInsets.all(20),
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color:  controller.isHoveringSingle.value 
                                 ?ColorsApp.WhiteSmoke:  Colors.white,
                                border: Border.all(
                                  color:  controller.isHoveringSingle.value
                                  ? Colors.black : Colors.black38,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Icon(Icons.person),
                                      Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color:  Colors.black,
                                            width: 0.5,
                                          ),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Text(
                                      "Let’s use Arabic".tr,
                                      textAlign: TextAlign.right,
                                      style: GoogleFonts.robotoCondensed(
                                        color: Colors.black,
                                        fontSize: Fonts.displayLarge,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  SizedBox(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
