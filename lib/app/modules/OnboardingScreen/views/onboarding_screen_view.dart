import 'package:aaqaqir_tirganin/app/config/Fonts/fonts.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/onboarding_screen_controller.dart';

class OnboardingScreenView extends GetView<OnboardingScreenController> {
  const OnboardingScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: Get.width,
        height: Get.height,
        padding: EdgeInsets.all(40),
        child: Stack(
          children: [
            Text(
              "AAQAQIR_TIRGANIN".tr,
              textAlign: TextAlign.right,
              style: GoogleFonts.pacifico(
                color: Colors.black,
                fontSize: Fonts.headlineMedium,
                fontWeight: FontWeight.w600,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Choose your language".tr,
                    textAlign: TextAlign.right,
                    style: GoogleFonts.merriweather(
                      color: Colors.black,
                      fontSize: Fonts.displayLarge,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                Row(
                  children: List.generate(
                    2, 
                    (index)=> Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              
                            ],
                          )
                        ],
                      ),
                    )
                  )
                )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
