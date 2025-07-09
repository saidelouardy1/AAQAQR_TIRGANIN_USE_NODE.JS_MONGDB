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
      body: Row(
        children: [
         SidebarX(
            ///////////////////////////////////////////////////////////////////// controller
            controller: SidebarXController(selectedIndex: 0, extended: true),
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
            ///////////////////////////////////////////////////////////////////// style item
            theme: SidebarXTheme(
              width: 175,
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
                    ColorsApp.Colors_gradientSplachscreen2.withAlpha(
                      (0.6 * 255).toInt(),
                    ),
                    ColorsApp.Colors_gradientSplachscreen1.withAlpha(
                      (0.3 * 255).toInt(),
                    ),
                    ColorsApp.Colors_gradientSplachscreen2.withAlpha(
                      (0.6 * 255).toInt(),
                    ),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              //////////////////////////////////////////////////// hover Text
              hoverTextStyle: TextStyle(
                fontSize: Fonts.headlineSmall,
                fontWeight: FontWeight.w700,
                color: ColorsApp.Colors_gradientSplachscreen1,
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
                      width: 18,
                      colorFilter: ColorFilter.mode(
                        controller.selectedIndex.value == 0 ? Colors.white : Colors.black,
                        BlendMode.srcIn,
                      ),
                    ),
                label: 'Home'.tr,
                onTap: (){
                  controller.changePage(0);
                  print(controller.selectedIndex.value);
                },
              ),
              SidebarXItem(
                iconBuilder:
                    (context, selected) => SvgPicture.asset(
                      ImagesIconApp.AllProduct,
                      width: 18,
                      colorFilter: ColorFilter.mode(
                        controller.selectedIndex.value == 1 ? Colors.white : Colors.black,
                        BlendMode.srcIn,
                      ),
                    ),
                label: 'View All Products'.tr,
                onTap: (){
                  controller.changePage(1);
                  print(controller.selectedIndex.value);
                },
              ),
              SidebarXItem(
               iconBuilder:
                    (context, selected) => SvgPicture.asset(
                      ImagesIconApp.PrintInvoiceLeft,
                      width: 18,
                      colorFilter: ColorFilter.mode(
                        controller.selectedIndex.value == 2 ? Colors.white : Colors.black,
                        BlendMode.srcIn,
                      ),
                    ),
                label: 'Print Invoice'.tr,
                 onTap: (){
                  controller.changePage(2);
                  print(controller.selectedIndex.value);
                },
              ),
              SidebarXItem(
                iconBuilder:
                    (context, selected) => SvgPicture.asset(
                      ImagesIconApp.Setting,
                      width: 18,
                      colorFilter:  ColorFilter.mode(
                        controller.selectedIndex.value == 3 ? Colors.white : Colors.black,
                        BlendMode.srcIn,
                      ),
                    ),
                label: 'Settings'.tr,
                 onTap: (){
                  controller.changePage(3);
                  print(controller.selectedIndex.value);
                },
              ),
            ],
          ),
         Expanded(
            child: Obx(
              (){
                return controller.pages[controller.selectedIndex.value];
              }
            )
          ),
        ],
      ),
    );
  }
}
