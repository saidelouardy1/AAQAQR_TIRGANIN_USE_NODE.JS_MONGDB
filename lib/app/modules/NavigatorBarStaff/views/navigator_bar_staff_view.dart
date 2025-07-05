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
            headerDivider: Container(
              padding: EdgeInsets.symmetric(horizontal: 10 ,vertical: 10),
              width: Get.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    foregroundImage: AssetImage(ImagesIconApp.logo),
                    radius: 15,
                  ),
                  Text(
                    'AAQAQIR_TIRGANIN'.tr,
                    style: TextStyle(
                      fontSize: Fonts.bodyLarge,
                      fontWeight: FontWeight.w700,
                      color: ColorsApp.Colors_gradientSplachscreen1,
                    ),
                  )
                ],
              ),
            ),
            controller: SidebarXController(selectedIndex: 0 , extended: true),
            showToggleButton: false,
            theme: SidebarXTheme(
              width: 170,
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
              textStyle: TextStyle(
                
              )
            ),
            items: [
              SidebarXItem(
                iconBuilder:
                    (context, selected) => SvgPicture.asset(
                      ImagesIconApp.Home,
                      width: 20,
                      colorFilter: ColorFilter.mode(
                        selected ? Colors.green : Colors.grey,
                        BlendMode.srcIn,
                      ),
                    ),
                label: 'Home',
              ),
          
              SidebarXItem(
                iconBuilder:
                    (context, selected) => SvgPicture.asset(
                      ImagesIconApp.Home,
                      width: 20,
                      colorFilter: ColorFilter.mode(
                        selected ? Colors.green : ColorsApp.Colors_gradientSplachscreen2,
                        BlendMode.srcIn,
                      ),
                    ),
                label: 'Home',
              ),
            ],
          ),
    );
  }
}
