import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/navigator_bar_staff_controller.dart';

class NavigatorBarStaffView extends GetView<NavigatorBarStaffController> {
  const NavigatorBarStaffView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NavigatorBarStaffView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'NavigatorBarStaffView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
