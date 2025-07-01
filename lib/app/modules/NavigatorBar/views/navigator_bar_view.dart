import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/navigator_bar_controller.dart';

class NavigatorBarView extends GetView<NavigatorBarController> {
  const NavigatorBarView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NavigatorBarView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'NavigatorBarView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
