import 'package:aaqaqir_tirganin/app/config/Assets/images.dart';
import 'package:aaqaqir_tirganin/app/config/Fonts/fonts.dart';
import 'package:aaqaqir_tirganin/app/config/themes/colors.dart';
import 'package:aaqaqir_tirganin/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

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
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Stack(
          children: [
            /// text tirganin
            Text(
              "AAQAQIR_TIRGANIN".tr,
              style: GoogleFonts.pacifico(
                color: Colors.black,
                fontSize: Fonts.headlineMedium,
                fontWeight: FontWeight.w600,
              ),
            ),
            //////animation translation
            Align(
              alignment: Alignment.center,
              child: Lottie.asset(ImagesIconApp.animation_translation),
            ),
            //// widget in senter for choose the language
            Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: SafeArea(
                  child: Column(
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
                      ///////// box
                      SizedBox(height: 20),
                      //////////////.........; container
                      IntrinsicWidth(
                        child: MouseRegion(
                          onEnter: (_) => controller.onEnterSingle(true),
                          onExit: (_) => controller.onEnterSingle(false),
                          child: Obx(
                            () => AnimatedContainer(
                              duration: Duration(milliseconds: 200),
                              curve: Curves.easeInOut,
                              height: Get.height / 4,
                              width: double.infinity,
                              margin: EdgeInsets.all(20),
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color:
                                    controller.isHoveringSingle.value
                                        ? ColorsApp.WhiteSmokeDarker
                                        : Colors.white,
                                border: Border.all(
                                  color:
                                      controller.isHoveringSingle.value
                                          ? Colors.black
                                          : Colors.black38,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset(
                                          ImagesIconApp.bookright,
                                          width: 20,
                                        ),
                                        Obx(
                                          () => GestureDetector(
                                            onTap: () {
                                              controller.isSelect.value = 2;
                                              controller.toggleLanguage(2);
                                            },
                                            child: Container(
                                              width: 25,
                                              height: 25,
                                              padding: EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.black,
                                                  width: 0.5,
                                                ),
                                                shape: BoxShape.circle,
                                              ),
                                              child:
                                                  controller.isSelect.value == 2
                                                      ? Container(
                                                        decoration:
                                                            BoxDecoration(
                                                              color:
                                                                  ColorsApp
                                                                      .Colors2,
                                                              shape:
                                                                  BoxShape
                                                                      .circle,
                                                            ),
                                                      )
                                                      : SizedBox(),
                                            ),
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
                      //////////////.........; container
                      Wrap(
                        alignment: WrapAlignment.center,
                        children: List.generate(
                          controller.ChooseLanguage.length,
                          (index) => IntrinsicWidth(
                            child: MouseRegion(
                              onEnter: (_) => controller.onEnter(index, true),
                              onExit: (_) => controller.onEnter(index, false),
                              child: Obx(
                                () => AnimatedContainer(
                                  duration: Duration(milliseconds: 200),
                                  curve: Curves.easeInOut,
                                  height: Get.height / 4,
                                  width: double.infinity,
                                  margin: EdgeInsets.all(20),
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color:
                                        controller.isHovering[index]
                                            ? ColorsApp.WhiteSmokeDarker
                                            : Colors.white,
                                    border: Border.all(
                                      color:
                                          controller.isHovering[index]
                                              ? Colors.black
                                              : Colors.black38,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SvgPicture.asset(
                                              ImagesIconApp.bookleft,
                                              width: 20,
                                            ),
                                            Obx(
                                              () => GestureDetector(
                                                onTap: () {
                                                  controller.isSelect.value =
                                                      index;
                                                  controller.toggleLanguage(
                                                    index,
                                                  );
                                                },
                                                child: Container(
                                                  width: 25,
                                                  height: 25,
                                                  padding: EdgeInsets.all(8),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: Colors.black,
                                                      width: 0.5,
                                                    ),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child:
                                                      controller
                                                                  .isSelect
                                                                  .value ==
                                                              index
                                                          ? Container(
                                                            decoration: BoxDecoration(
                                                              color:
                                                                  ColorsApp
                                                                      .Colors2,
                                                              shape:
                                                                  BoxShape
                                                                      .circle,
                                                            ),
                                                          )
                                                          : SizedBox(),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(20),
                                          child: Text(
                                            controller.ChooseLanguage[index].tr,
                                            textAlign: TextAlign.right,
                                            style: GoogleFonts.robotoCondensed(
                                              color: Colors.black,
                                              fontSize: Fonts.displayLarge,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      ///////// box
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //////////// button to move
                  SizedBox(
                    width: Get.width / 5.5,
                    height: Get.height / 13,
                    child: Obx(
                      () => ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              controller.isSelect.value > (-1)
                                  ? Colors.black
                                  : Colors.grey[200],
                          foregroundColor: Colors.grey[600],
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          minimumSize: Size(double.infinity, double.infinity),
                        ),
                        onPressed: () {
                          if (controller.isSelect.value > (-1)) {
                            Get.toNamed(Routes.ROLESELECATIONSCREEN);
                            controller.initNumber.value++;
                          }
                        },
                        child: Text(
                          "Next Step".tr,
                          style: GoogleFonts.robotoCondensed(
                            color:
                                controller.isSelect.value > (-1)
                                    ? Colors.white
                                    : Colors.grey[500],
                            fontWeight: FontWeight.w600,
                            fontSize: Fonts.titleSmall,
                          ),
                        ),
                      ),
                    ),
                  ),
                  ///////// box
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: List.generate(
                      controller.ChooseRoles.length,
                      (index) => Obx(
                        () => Container(
                          width: 90,
                          height: 2,
                          margin: EdgeInsets.only(top: 20, left: 2, right: 2),
                          decoration: BoxDecoration(
                            color:
                                controller.initNumber.value == index
                                    ? Colors.black
                                    : Colors.grey[350],
                            borderRadius: BorderRadius.circular(50),
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
