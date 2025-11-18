import 'dart:async';
import 'package:aaqaqir_tirganin/app/Service/products.dart';
import 'package:aaqaqir_tirganin/app/model/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryProductsViewAdminController extends GetxController {
  var isLoading = false.obs;
  var products = <Product>[].obs;
  var categoryName = ''.obs;
  var categoryId = ''.obs;
  
  final ProductService _productService = ProductService();
  StreamSubscription? _productsSubscription;

  @override
  void onInit() {
    super.onInit();
    _getArguments();
    loadProductsFromFirebase();
  }
   
  void _getArguments() {
    final arguments = Get.arguments;
    if (arguments != null && arguments is Map) {
      categoryId.value = arguments['categoryId'] ?? '';
      categoryName.value = arguments['categoryName'] ?? '';
      
      print('Category ID: ${categoryId.value}');
      print('Category Name: ${categoryName.value}');
    }
  }
   
  Future<void> loadProductsFromFirebase() async {
    try {
      isLoading(true);
      final productsList = await _productService.getProductsByCategory(categoryId.value);
      products.assignAll(productsList);
    } catch (e) {
      print("Error loading categories: $e");
      Get.snackbar(
        'خطأ',
        'فشل في تحميل product',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading(false);
    }
  }

  // إضافة منتج جديد
  Future<void> addNewProduct() async {
    final nameController = TextEditingController();
    final priceController = TextEditingController();
    final quantityController = TextEditingController();
    
    Get.defaultDialog(
      title: 'إضافة منتج جديد',
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'اسم المنتج',
                border: OutlineInputBorder(),
                hintText: 'أدخل اسم المنتج',
              ),
              autofocus: true,
            ),
            SizedBox(height: 12),
            TextField(
              controller: priceController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'السعر',
                border: OutlineInputBorder(),
                suffixText: 'د.ج',
                hintText: '0.00',
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: quantityController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'الكمية',
                border: OutlineInputBorder(),
                hintText: '0',
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      if (nameController.text.trim().isEmpty) {
                        Get.snackbar('خطأ', 'يرجى إدخال اسم المنتج');
                        return;
                      }
                      
                      try {
                        final newProduct = Product(
                          id: '', // سيتم تعبئته من Firebase
                          categoryId: categoryId.value,
                          name: nameController.text.trim(),
                          price: double.tryParse(priceController.text) ?? 0.0,
                          quantity: int.tryParse(quantityController.text) ?? 0,
                        );
                        products.add(newProduct);
                        await _productService.addProduct(newProduct);
                        
                        Get.back();
                        Get.snackbar(
                          'تم الإضافة',
                          'تم إضافة المنتج بنجاح',
                          backgroundColor: Colors.green,
                          colorText: Colors.white,
                        );
                        
                      } catch (e) {
                        Get.snackbar(
                          'خطأ',
                          'فشل في إضافة المنتج',
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        );
                      }
                    },
                    child: Text('إضافة'),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Get.back(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                    ),
                    child: Text('إلغاء'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // تعديل منتج
  Future<void> editProduct(int index) async {
    final product = products[index];
    final nameController = TextEditingController(text: product.name);
    final priceController = TextEditingController(text: product.price.toString());
    final quantityController = TextEditingController(text: product.quantity.toString());
    
    Get.defaultDialog(
      title: 'تعديل المنتج',
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'اسم المنتج',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: priceController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'السعر',
                border: OutlineInputBorder(),
                suffixText: 'د.ج',
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: quantityController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'الكمية',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      try {
                        final updatedProduct = Product(
                          id: product.id,
                          categoryId: product.categoryId,
                          name: nameController.text.trim(),
                          price: double.tryParse(priceController.text) ?? product.price,
                          quantity: int.tryParse(quantityController.text) ?? product.quantity,
                        );
                        
                        await _productService.updateProduct(updatedProduct);
                        
                        Get.back();
                        Get.snackbar(
                          'تم التعديل',
                          'تم تعديل المنتج بنجاح',
                          backgroundColor: Colors.blue,
                          colorText: Colors.white,
                        );
                        
                      } catch (e) {
                        Get.snackbar(
                          'خطأ',
                          'فشل في تعديل المنتج',
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        );
                      }
                    },
                    child: Text('حفظ'),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Get.back(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                    ),
                    child: Text('إلغاء'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // حذف منتج
  Future<void> deleteProduct(int index) async {
    final product = products[index];
    
    Get.defaultDialog(
      title: 'تأكيد الحذف',
      middleText: 'هل أنت متأكد من حذف "${product.name}"؟',
      textConfirm: 'نعم',
      textCancel: 'لا',
      onConfirm: () async {
        try {
          await _productService.deleteProduct(product.id);
          
          Get.back();
          Get.snackbar(
            'تم الحذف',
            'تم حذف المنتج بنجاح',
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
          
        } catch (e) {
          Get.snackbar(
            'خطأ',
            'فشل في حذف المنتج',
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      },
    );
  }

  @override
  void onClose() {
    _productsSubscription?.cancel();
    super.onClose();
  }
}