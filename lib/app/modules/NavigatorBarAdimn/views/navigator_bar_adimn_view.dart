import 'package:aaqaqir_tirganin/app/config/Assets/images.dart';
import 'package:aaqaqir_tirganin/app/config/Fonts/fonts.dart';
import 'package:aaqaqir_tirganin/app/config/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sidebarx/sidebarx.dart';

import '../controllers/navigator_bar_adimn_controller.dart';

class NavigatorBarAdimnView extends GetView<NavigatorBarAdimnController> {
  const NavigatorBarAdimnView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          SidebarX(
            ///////////////////////////////////////////////////////////////////// controller
            controller: controller.sidebarController,
            /////////////////////////////////////////////////////// header Divider
            headerDivider: Container(
              padding: EdgeInsets.only(top: 20, bottom: 10),
              width: Get.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    foregroundImage: AssetImage(ImagesIconApp.logo),
                    radius: 15,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'AAQAQIR_TIRGANIN'.tr,
                    style: GoogleFonts.pacifico(
                      fontSize: Fonts.bodyLarge,
                      fontWeight: FontWeight.w700,
                      color: ColorsApp.Colors_gradientSplachscreen1,
                    ),
                  ),
                ],
              ),
            ),
            showToggleButton: false,
            extendedTheme: SidebarXTheme(width: 175),
            ///////////////////////////////////////////////////////////////////// style item
            theme: SidebarXTheme(
              selectedItemMargin: EdgeInsets.symmetric(horizontal: 7),
              selectedItemTextPadding: EdgeInsets.symmetric(horizontal: 5),
              itemTextPadding: EdgeInsets.symmetric(horizontal: 5),
              selectedItemPadding: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 7,
              ),
              itemMargin: EdgeInsets.symmetric(horizontal: 7),
              itemPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 7),
              ///////////////////////////////////////////////// Shodow sid bar
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10, 
                    spreadRadius: 10,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              ///////////////////////////////////////////////// style item in side bar
              selectedItemDecoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    ColorsApp.Colors_gradientSplachscreen2.withAlpha(
                      (0.5 * 255).toInt(),
                    ),
                    ColorsApp.Colors_gradientSplachscreen1.withAlpha(
                      (0.2 * 255).toInt(),
                    ),
                    ColorsApp.Colors_gradientSplachscreen2.withAlpha(
                      (0.5 * 255).toInt(),
                    ),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              //////////////////////////////////////////////////// hover Text
              hoverTextStyle: GoogleFonts.inter(
                fontSize: Fonts.headlineSmall,
                fontWeight: FontWeight.w700,
                color: ColorsApp.Colors_gradientSplachscreen1,
              ),
              ///////////////////////////////////////////////// selected text style
              selectedTextStyle: GoogleFonts.inter(
                fontSize: Fonts.headlineMedium,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
              textStyle: GoogleFonts.inter(
                fontSize: Fonts.headlineSmall,
                fontWeight: FontWeight.w700,
                color: ColorsApp.Colors_gradientSplachscreen1,
              ),
            ),
            ///////////////////////////////////////////////////////////// items
            items: [
              SidebarXItem(
                iconBuilder:
                    (context, selected) => SvgPicture.asset(
                      ImagesIconApp.Home,
                      width: 18,
                      colorFilter: ColorFilter.mode(
                        controller.selectedIndex.value == 0
                            ? Colors.white
                            : Colors.black,
                        BlendMode.srcIn,
                      ),
                    ),
                label: 'Dashboard'.tr,
                onTap: () {
                  controller.selectedIndex(0);
                  print(controller.selectedIndex.value);
                },
              ),
              SidebarXItem(
                iconBuilder:
                    (context, selected) => SvgPicture.asset(
                      ImagesIconApp.AllProduct,
                      width: 18,
                      colorFilter: ColorFilter.mode(
                        controller.selectedIndex.value == 1
                            ? Colors.white
                            : Colors.black,
                        BlendMode.srcIn,
                      ),
                    ),
                label: 'StoreManagementView'.tr,
                onTap: () {
                  controller.selectedIndex(1);
                  print(controller.selectedIndex.value);
                },
              ),
              SidebarXItem(
                iconBuilder:
                    (context, selected) => SvgPicture.asset(
                      ImagesIconApp.Setting,
                      width: 18,
                      colorFilter: ColorFilter.mode(
                        controller.selectedIndex.value == 2
                            ? Colors.white
                            : Colors.black,
                        BlendMode.srcIn,
                      ),
                    ),
                label: 'settings'.tr,
                onTap: () {
                  controller.selectedIndex(2);
                  print(controller.selectedIndex.value);
                },
              ),
            ],
          ),
          Expanded(
            child: Obx(() {
              return controller.Changepage(controller.selectedIndex.value);
            }),
          ),
        ],
      ),
    );
  }
}
