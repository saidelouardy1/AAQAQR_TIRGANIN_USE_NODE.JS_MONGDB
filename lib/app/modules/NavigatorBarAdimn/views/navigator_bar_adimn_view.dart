import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/navigator_bar_adimn_controller.dart';

class NavigatorBarAdimnView extends GetView<NavigatorBarAdimnController> {
  const NavigatorBarAdimnView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NavigatorBarAdimnView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'NavigatorBarAdimnView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
