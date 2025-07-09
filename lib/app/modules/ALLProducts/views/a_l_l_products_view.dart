import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/a_l_l_products_controller.dart';

class ALLProductsView extends GetView<ALLProductsController> {
  const ALLProductsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ALLProductsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ALLProductsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
