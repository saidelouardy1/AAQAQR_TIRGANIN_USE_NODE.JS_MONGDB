import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/print_invoice_controller.dart';

class PrintInvoiceView extends GetView<PrintInvoiceController> {
  const PrintInvoiceView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PrintInvoiceView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PrintInvoiceView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
