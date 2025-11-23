import 'package:aaqaqir_tirganin/app/Service/catigores.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aaqaqir_tirganin/app/model/Category.dart';

class HomeAdminController extends GetxController {
  var categories = <CategoryModel>[].obs;
  var isLoading = false.obs;
  var isAdding = false.obs;
  var isEditing = false.obs;
  var isDeleting = false.obs;
  
  final CategoryService _categoryService = CategoryService();

  @override
  void onInit() {
    super.onInit();
    loadCategoriesFromFirebase();
  }

  // جلب الفئات من Firebase مع معالجة أفضل للأخطاء
  Future<void> loadCategoriesFromFirebase() async {
    try {
      isLoading(true);
      final categoriesList = await _categoryService.getAllCategories();
      categories.assignAll(categoriesList);
    } catch (e) {
      print("Error loading categories: $e");
      Get.snackbar(
        'خطأ في التحميل',
        'تعذر تحميل الفئات. تأكد من اتصال الإنترنت',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: Duration(seconds: 3),
      );
    } finally {
      isLoading(false);
    }
  }

  // إضافة فئة جديدة مع تحسينات
  Future<void> addNewCategory() async {
    final TextEditingController nameController = TextEditingController();
    final FocusNode focusNode = FocusNode();
    
    Get.defaultDialog(
      barrierDismissible: false,
      title: 'إضافة فئة جديدة',
      titlePadding: EdgeInsets.only(top: 20),
      contentPadding: EdgeInsets.all(20),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: nameController,
            focusNode: focusNode,
            decoration: InputDecoration(
              labelText: 'اسم الفئة',
              border: OutlineInputBorder(),
              hintText: 'أدخل اسم الفئة',
              prefixIcon: Icon(Icons.category),
            ),
            textInputAction: TextInputAction.done,
            onSubmitted: (_) => _handleAddCategory(nameController.text.trim()),
          ),
          SizedBox(height: 20),
          Obx(() => isAdding.value 
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
                      onPressed: () => _handleAddCategory(nameController.text.trim()),
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
    );

    // تركيز على حقل النص بعد فتح الديالوج
    Future.delayed(Duration(milliseconds: 300), () {
      focusNode.requestFocus();
    });
  }

  // معالجة إضافة الفئة
  Future<void> _handleAddCategory(String categoryName) async {
    if (categoryName.isEmpty) {
      Get.snackbar(
        'خطأ', 
        'يرجى إدخال اسم الفئة',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    // التحقق من عدم تكرار الفئة
    if (categories.any((cat) => cat.name.toLowerCase() == categoryName.toLowerCase())) {
      Get.snackbar(
        'خطأ', 
        'الفئة "$categoryName" موجودة مسبقاً',
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
      return;
    }

    try {
      isAdding(true);
      
      // إضافة الفئة إلى Firebase
      final newCategory = CategoryModel(
        id: '', // سيتم تعبئته تلقائياً من Firebase
        name: categoryName,
        productCount: 0,
      );
      
      await _categoryService.addCategory(newCategory);
      
      Get.back();
      Get.snackbar(
        'تم الإضافة', 
        'تم إضافة الفئة "$categoryName" بنجاح',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        duration: Duration(seconds: 2),
      );
      
      // إعادة تحميل الفئات
      await loadCategoriesFromFirebase();
      
    } catch (e) {
      print("Error adding category: $e");
      Get.snackbar(
        'خطأ في الإضافة', 
        'فشل في إضافة الفئة. حاول مرة أخرى',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isAdding(false);
    }
  }

  // تعديل فئة موجودة مع تحسينات
  Future<void> editCategory(int index) async {
    final category = categories[index];
    final TextEditingController nameController = 
        TextEditingController(text: category.name);
    final FocusNode focusNode = FocusNode();
    
    Get.defaultDialog(
      barrierDismissible: false,
      title: 'تعديل الفئة',
      titlePadding: EdgeInsets.only(top: 20),
      contentPadding: EdgeInsets.all(20),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: nameController,
            focusNode: focusNode,
            decoration: InputDecoration(
              labelText: 'اسم الفئة',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.edit),
            ),
            textInputAction: TextInputAction.done,
            onSubmitted: (_) => _handleEditCategory(category, nameController.text.trim()),
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
                      onPressed: () => _handleEditCategory(category, nameController.text.trim()),
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
    );

    Future.delayed(Duration(milliseconds: 300), () {
      focusNode.requestFocus();
      nameController.selection = TextSelection(
        baseOffset: 0,
        extentOffset: nameController.text.length,
      );
    });
  }

  // معالجة تعديل الفئة
  Future<void> _handleEditCategory(CategoryModel category, String newName) async {
    if (newName.isEmpty) {
      Get.snackbar(
        'خطأ', 
        'يرجى إدخال اسم الفئة',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    // إذا لم يتغير الاسم
    if (category.name == newName) {
      Get.back();
      return;
    }

    // التحقق من عدم تكرار الفئة
    if (categories.any((cat) => 
        cat.id != category.id && cat.name.toLowerCase() == newName.toLowerCase())) {
      Get.snackbar(
        'خطأ', 
        'الفئة "$newName" موجودة مسبقاً',
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
      return;
    }

    try {
      isEditing(true);
      
      // تحديث الفئة في Firebase
      final updatedCategory = category.copyWith(name: newName);
      await _categoryService.updateCategory(updatedCategory);
      
      Get.back();
      Get.snackbar(
        'تم التعديل', 
        'تم تعديل الفئة بنجاح',
        backgroundColor: Colors.blue,
        colorText: Colors.white,
        duration: Duration(seconds: 2),
      );
      
      // إعادة تحميل الفئات
      await loadCategoriesFromFirebase();
      
    } catch (e) {
      print("Error updating category: $e");
      Get.snackbar(
        'خطأ في التعديل', 
        'فشل في تعديل الفئة. حاول مرة أخرى',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isEditing(false);
    }
  }

  // حذف فئة مع تحسينات
  Future<void> deleteCategory(int index) async {
    final category = categories[index];
    
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
            'هل أنت متأكد من حذف الفئة:',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 8),
          Text(
            '"${category.name}"',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'سيتم حذف ${category.productCount} منتج مرتبط بهذه الفئة',
            style: TextStyle(fontSize: 14, color: Colors.grey),
            textAlign: TextAlign.center,
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
                      onPressed: () => _handleDeleteCategory(category),
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

  // معالجة حذف الفئة
  Future<void> _handleDeleteCategory(CategoryModel category) async {
    try {
      isDeleting(true);
      
      await _categoryService.deleteCategory(category.id);
      
      Get.back();
      Get.snackbar(
        'تم الحذف', 
        'تم حذف الفئة "${category.name}" بنجاح',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        duration: Duration(seconds: 2),
      );
      
      // إعادة تحميل الفئات
      await loadCategoriesFromFirebase();
      
    } catch (e) {
      print("Error deleting category: $e");
      Get.snackbar(
        'خطأ في الحذف', 
        'فشل في حذف الفئة. حاول مرة أخرى',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isDeleting(false);
    }
  }
}