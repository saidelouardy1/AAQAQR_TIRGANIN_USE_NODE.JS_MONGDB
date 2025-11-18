import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/store_management_controller.dart';

class StoreManagementView extends GetView<StoreManagementController> {
  const StoreManagementView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StoreManagementView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'StoreManagementView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
