import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/products_view_controller.dart';

class ProductsViewView extends GetView<ProductsViewController> {
  const ProductsViewView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProductsViewView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProductsViewView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
