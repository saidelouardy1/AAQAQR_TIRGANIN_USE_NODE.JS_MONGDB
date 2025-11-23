import 'dart:async';
import 'package:aaqaqir_tirganin/app/Service/products.dart';
import 'package:aaqaqir_tirganin/app/model/product.dart';
import 'package:aaqaqir_tirganin/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsViewAdminController extends GetxController {
  var isLoading = false.obs;
  var isAdding = false.obs;
  var isEditing = false.obs;
  var isDeleting = false.obs;
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
    }
  }
   
  Future<void> loadProductsFromFirebase() async {
    try {
      isLoading(true);
      final productsList = await _productService.getProductsByCategory(categoryId.value);
      products.assignAll(productsList);
    } catch (e) {
      print("Error loading products: $e");
      Get.snackbar(
        'خطأ في التحميل',
        'تعذر تحميل المنتجات. تأكد من اتصال الإنترنت',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: Duration(seconds: 3),
      );
    } finally {
      isLoading(false);
    }
  }

  // إضافة منتج جديد مع تحسينات
  Future<void> addNewProduct() async {
    final nameController = TextEditingController();
    final priceController = TextEditingController();
    final quantityController = TextEditingController();
    final FocusNode nameFocusNode = FocusNode();
    
    Get.defaultDialog(
      barrierDismissible: false,
      title: 'إضافة منتج جديد',
      titlePadding: EdgeInsets.only(top: 20),
      contentPadding: EdgeInsets.all(20),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              focusNode: nameFocusNode,
              decoration: InputDecoration(
                labelText: 'اسم المنتج',
                border: OutlineInputBorder(),
                hintText: 'أدخل اسم المنتج',
                prefixIcon: Icon(Icons.shopping_bag),
              ),
              textInputAction: TextInputAction.next,
            ),
            SizedBox(height: 12),
            TextField(
              controller: priceController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'السعر',
                border: OutlineInputBorder(),
                prefixText: 'HD',
                hintText: '0.00',
                prefixIcon: Icon(Icons.attach_money),
              ),
              textInputAction: TextInputAction.next,
            ),
            SizedBox(height: 12),
            TextField(
              controller: quantityController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'الكمية',
                border: OutlineInputBorder(),
                hintText: '0',
                prefixIcon: Icon(Icons.inventory),
              ),
              textInputAction: TextInputAction.done,
              onSubmitted: (_) => _handleAddProduct(
                nameController.text.trim(),
                priceController.text,
                quantityController.text,
              ),
            ),
            SizedBox(height: 20),
            Obx(() => isAdding.value 
              ? Center(child: CircularProgressIndicator())
              : Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: ()  {
                          FocusScope.of(Get.context!).unfocus();
                          Get.back();
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.grey,
                          side: BorderSide(color: Colors.grey),
                          padding: EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: Text('إلغاء'),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => _handleAddProduct(
                          nameController.text.trim(),
                          priceController.text,
                          quantityController.text,
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[700],
                          padding: EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: Text('إضافة'),
                      ),
                    ),
                  ],
                ),
            ),
          ],
        ),
      ),
    );

    Future.delayed(Duration(milliseconds: 300), () {
      nameFocusNode.requestFocus();
    });
  }

  // معالجة إضافة المنتج
  Future<void> _handleAddProduct(String name, String price, String quantity) async {
    if (name.isEmpty) {
      Get.snackbar(
        'خطأ', 
        'يرجى إدخال اسم المنتج',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    final priceValue = double.tryParse(price) ?? 0.0;
    final quantityValue = int.tryParse(quantity) ?? 0;

    if (priceValue <= 0) {
      Get.snackbar(
        'خطأ', 
        'يرجى إدخال سعر صحيح',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    // التحقق من عدم تكرار المنتج
    if (products.any((product) => 
        product.name.toLowerCase() == name.toLowerCase() && 
        product.categoryId == categoryId.value)) {
      Get.snackbar(
        'خطأ', 
        'المنتج "$name" موجود مسبقاً في هذه الفئة',
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
      return;
    }

    try {
      isAdding(true);
      
      final newProduct = Product(
        id: '',
        categoryId: categoryId.value,
        name: name,
        price: priceValue,
        quantity: quantityValue,
      );
      
      await _productService.addProduct(newProduct);
      await loadProductsFromFirebase();
      
      Get.back();
      Get.snackbar(
        'تم الإضافة',
        'تم إضافة المنتج "$name" بنجاح',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        duration: Duration(seconds: 2),
      );
      
    } catch (e) {
      print("Error adding product: $e");
      Get.snackbar(
        'خطأ في الإضافة',
        'فشل في إضافة المنتج. حاول مرة أخرى',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isAdding(false);
    }
  }

  // تعديل منتج مع تحسينات
  Future<void> editProduct(int index) async {
    final product = products[index];
    final nameController = TextEditingController(text: product.name);
    final priceController = TextEditingController(text: product.price.toStringAsFixed(2));
    final quantityController = TextEditingController(text: product.quantity.toString());
    final FocusNode nameFocusNode = FocusNode();
    
    Get.defaultDialog(
      barrierDismissible: false,
      title: 'تعديل المنتج',
      titlePadding: EdgeInsets.only(top: 20),
      contentPadding: EdgeInsets.all(20),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              focusNode: nameFocusNode,
              decoration: InputDecoration(
                labelText: 'اسم المنتج',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.shopping_bag),
              ),
              textInputAction: TextInputAction.next,
            ),
            SizedBox(height: 12),
            TextField(
              controller: priceController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'السعر',
                border: OutlineInputBorder(),
                prefixText: 'د.ج ',
                prefixIcon: Icon(Icons.attach_money),
              ),
              textInputAction: TextInputAction.next,
            ),
            SizedBox(height: 12),
            TextField(
              controller: quantityController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'الكمية',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.inventory),
              ),
              textInputAction: TextInputAction.done,
              onSubmitted: (_) => _handleEditProduct(
                product,
                nameController.text.trim(),
                priceController.text,
                quantityController.text,
              ),
            ),
            SizedBox(height: 20),
            Obx(() => isEditing.value 
              ? Center(child: CircularProgressIndicator())
              : Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Get.back(),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.grey,
                          side: BorderSide(color: Colors.grey),
                          padding: EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: Text('إلغاء'),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => _handleEditProduct(
                          product,
                          nameController.text.trim(),
                          priceController.text,
                          quantityController.text,
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[700],
                          padding: EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: Text('حفظ'),
                      ),
                    ),
                  ],
                ),
            ),
          ],
        ),
      ),
    );

    Future.delayed(Duration(milliseconds: 300), () {
      nameFocusNode.requestFocus();
      nameController.selection = TextSelection(
        baseOffset: 0,
        extentOffset: nameController.text.length,
      );
    });
  }

  // معالجة تعديل المنتج
  Future<void> _handleEditProduct(Product product, String name, String price, String quantity) async {
    if (name.isEmpty) {
      Get.snackbar(
        'خطأ', 
        'يرجى إدخال اسم المنتج',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    final priceValue = double.tryParse(price) ?? product.price;
    final quantityValue = int.tryParse(quantity) ?? product.quantity;

    if (priceValue <= 0) {
      Get.snackbar(
        'خطأ', 
        'يرجى إدخال سعر صحيح',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    // إذا لم يتغير شيء
    if (product.name == name && product.price == priceValue && product.quantity == quantityValue) {
      Get.back();
      return;
    }

    // التحقق من عدم تكرار المنتج (باستثناء المنتج الحالي)
    if (products.any((p) => 
        p.id != product.id && 
        p.name.toLowerCase() == name.toLowerCase() && 
        p.categoryId == categoryId.value)) {
      Get.snackbar(
        'خطأ', 
        'المنتج "$name" موجود مسبقاً في هذه الفئة',
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
      return;
    }

    try {
      isEditing(true);
      
      final updatedProduct = Product(
        id: product.id,
        categoryId: product.categoryId,
        name: name,
        price: priceValue,
        quantity: quantityValue,
      );
      
      await _productService.updateProduct(updatedProduct);
      await loadProductsFromFirebase();
      
      Get.back();
      Get.snackbar(
        'تم التعديل',
        'تم تعديل المنتج بنجاح',
        backgroundColor: Colors.blue,
        colorText: Colors.white,
        duration: Duration(seconds: 2),
      );
      
    } catch (e) {
      print("Error updating product: $e");
      Get.snackbar(
        'خطأ في التعديل',
        'فشل في تعديل المنتج. حاول مرة أخرى',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isEditing(false);
    }
  }

  // حذف منتج مع تحسينات
  Future<void> deleteProduct(int index) async {
    final product = products[index];
    
    Get.defaultDialog(
      barrierDismissible: false,
      title: 'تأكيد الحذف',
      titlePadding: EdgeInsets.only(top: 20),
      contentPadding: EdgeInsets.all(20),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.warning_amber_rounded,
            size: 60,
            color: Colors.orange,
          ),
          SizedBox(height: 16),
          Text(
            'هل أنت متأكد من حذف المنتج:',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 8),
          Text(
            '"${product.name}"',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'السعر: ${product.price} د.ج',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          Text(
            'الكمية: ${product.quantity}',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          SizedBox(height: 20),
          Obx(() => isDeleting.value 
            ? Center(child: CircularProgressIndicator())
            : Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Get.back(),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.grey,
                        side: BorderSide(color: Colors.grey),
                        padding: EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: Text('إلغاء'),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => _handleDeleteProduct(product),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: Text('حذف'),
                    ),
                  ),
                ],
              ),
          ),
        ],
      ),
    );
  }

  // معالجة حذف المنتج
  Future<void> _handleDeleteProduct(Product product) async {
    try {
      isDeleting(true);
      
      await _productService.deleteProduct(product.id, product.categoryId);
      await loadProductsFromFirebase();
      
      Get.back();
      Get.snackbar(
        'تم الحذف',
        'تم حذف المنتج "${product.name}" بنجاح',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        duration: Duration(seconds: 2),
      );
      
    } catch (e) {
      print("Error deleting product: $e");
      Get.snackbar(
        'خطأ في الحذف',
        'فشل في حذف المنتج. حاول مرة أخرى',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isDeleting(false);
    }
  }

  @override
  void onClose() {
    _productsSubscription?.cancel();
    super.onClose();
  }
}