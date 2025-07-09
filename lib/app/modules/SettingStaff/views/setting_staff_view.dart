import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/setting_staff_controller.dart';

class SettingStaffView extends GetView<SettingStaffController> {
  const SettingStaffView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SettingStaffView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SettingStaffView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
