import 'package:aaqaqir_tirganin/app/config/Assets/images.dart';
import 'package:aaqaqir_tirganin/app/config/Fonts/fonts.dart';
import 'package:aaqaqir_tirganin/app/config/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/navigator_bar_staff_controller.dart';
import 'package:sidebarx/sidebarx.dart';

class NavigatorBarStaffView extends GetView<NavigatorBarStaffController> {
  const NavigatorBarStaffView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.Grey6,
      body: SidebarX(
        controller: SidebarXController(selectedIndex: 0, extended: true),
        headerDivider: Container(
          padding: EdgeInsets.only(top: 20, bottom: 10),
          width: Get.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /////////////////////////////////////////////////////// header Divider
              CircleAvatar(
                foregroundImage: AssetImage(ImagesIconApp.logo),
                radius: 15,
              ),
              SizedBox(width: 5),
              Text(
                'AAQAQIR_TIRGANIN'.tr,
                style: TextStyle(
                  fontSize: Fonts.bodyLarge,
                  fontWeight: FontWeight.w700,
                  color: ColorsApp.Colors_gradientSplachscreen1,
                ),
              ),
            ],
          ),
        ),
        showToggleButton: false,
        ///////////////////////////////////////////////////////////////////// controller
        theme: SidebarXTheme(
          width: 170,
          selectedItemMargin: EdgeInsets.symmetric(horizontal: 5),
          selectedItemTextPadding: EdgeInsets.symmetric(horizontal: 5),
          itemTextPadding: EdgeInsets.symmetric(horizontal: 5),
          itemMargin: EdgeInsets.symmetric(horizontal: 5),
          //////////////////////////////////////////////////// hover Text 
          hoverTextStyle: TextStyle(
            fontSize: Fonts.headlineSmall,
            fontWeight: FontWeight.w700,
            color: ColorsApp.Colors_gradientSplachscreen1,
          ),
          ///////////////////////////////////////////////// Shodow sid bar
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha((0.1 * 255).toInt()),
                blurRadius: 12,
                offset: Offset(2, 4),
              ),
            ],
          ),
          ///////////////////////////////////////////////// style item in side bar
          selectedItemDecoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ColorsApp.Colors_gradientSplachscreen2.withAlpha((0.7 * 255).toInt()),
                ColorsApp.Colors_gradientSplachscreen1.withAlpha((0.4 * 255).toInt()),
                ColorsApp.Colors_gradientSplachscreen2.withAlpha((0.7 * 255).toInt()),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          ///////////////////////////////////////////////// selected text style
          selectedTextStyle: TextStyle(
            fontSize: Fonts.headlineMedium,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          textStyle: TextStyle(
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
                  width: 20,
                //   colorFilter: ColorFilter.mode(
                //     selected
                //         ? Colors.black
                //         : Colors.white,
                //     BlendMode.srcIn,
                //   ),
                ),
            label: 'Home',
          ),
          SidebarXItem(
            iconBuilder:
                (context, selected) => SvgPicture.asset(
                  ImagesIconApp.Home,
                  width: 20,
                  // colorFilter: ColorFilter.mode(
                  //   selected
                  //       ? Colors.green
                  //       : ColorsApp.Colors_gradientSplachscreen2,
                  //   BlendMode.srcIn,
                  // ),
                ),
            label: 'Home',
          ),
        ],
      ),
    );
  }
}
