import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/navigator_bar_staff_controller.dart';
import 'package:sidebarx/sidebarx.dart';

class NavigatorBarStaffView extends GetView<NavigatorBarStaffController> {
  const NavigatorBarStaffView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SidebarX(
        controller: SidebarXController(selectedIndex: 0),
        items: const [
              SidebarXItem(
                icon: Icons.home, label: 'Home'
                
              ),
              SidebarXItem(icon: Icons.search, label: 'Search'),
            ],
          showToggleButton: false,
        ),
    );
  }
}
