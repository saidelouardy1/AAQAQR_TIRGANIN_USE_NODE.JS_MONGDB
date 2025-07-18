import 'package:aaqaqir_tirganin/app/config/Assets/images.dart';
import 'package:aaqaqir_tirganin/app/config/Fonts/fonts.dart';
import 'package:aaqaqir_tirganin/app/config/themes/colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/onboarding_screen_controller.dart';

class RoleselectionScreen extends GetView<OnboardingScreenController> {
  const RoleselectionScreen({super.key});

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
            ////////////  Text with ico back
            SingleChildScrollView(
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                      controller.initNumber.value = 0;
                    },
                    icon: Get.locale?.languageCode == "ar" ? SvgPicture.asset(ImagesIconApp.iconbackright) :  SvgPicture.asset(ImagesIconApp.iconbackleft) ,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "AAQAQIR_TIRGANIN".tr,
                    style: GoogleFonts.pacifico(
                      color: Colors.black,
                      fontSize: Fonts.headlineMedium,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            /////////////// text
            Align(
              alignment: Alignment.topCenter,
              child: Transform.translate(
                offset: Offset(0, 30),
                child: Text(
                  "Join as".tr,
                  style: GoogleFonts.robotoCondensed(
                    color: ColorsApp.Colors_gradientSplachscreen1,
                    fontSize: Fonts.Large,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorsApp.Colors_gradientSplachscreen2,
                    width: 2,
                  ),
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  backgroundImage: AssetImage(ImagesIconApp.logo),
                  radius: 190,
                ),
              ),
            ),
            ////////////// container
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ////////////.........; container
                  Wrap(
                    alignment: WrapAlignment.center,
                    children: List.generate(
                      controller.ChooseRoles.length,
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
                                        ImagesIconApp.bookleft,
                                        width: 20,
                                      ),
                                      Obx(
                                        () => GestureDetector(
                                          onTap: () {
                                            controller.isSelectRoles.value =
                                                index;
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
                                                            .isSelectRoles
                                                            .value ==
                                                        index
                                                    ? Container(
                                                      decoration: BoxDecoration(
                                                        color:
                                                            ColorsApp.Colors2,
                                                        shape: BoxShape.circle,
                                                      ),
                                                    )
                                                    : SizedBox(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 60 , vertical: 20),
                                    child: Text(
                                      controller.ChooseRoles[index].tr,
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
                  Transform.translate(
                    offset: Offset(0, 10),
                    child: SizedBox(
                      width: Get.width / 5,
                      child: Text(
                        "Choose".tr,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.robotoCondensed(
                          color: Colors.white30,
                          fontSize: Fonts.titleLarge,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            /////////////// Button
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: Get.width / 5.5,
                    height: Get.height / 13,
                    child: Obx(
                      () => ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              controller.isSelectRoles.value > (-1)
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
                          controller.toggleRoles(
                            controller.isSelectRoles.value,
                          );
                        },
                        child: Text(
                          "Next Step".tr,
                          style: GoogleFonts.robotoCondensed(
                            color:
                                controller.isSelectRoles.value > (-1)
                                    ? Colors.white
                                    : Colors.grey[500],
                            fontWeight: FontWeight.w600,
                            fontSize: Fonts.titleSmall,
                          ),
                        ),
                      ),
                    ),
                  ),
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
