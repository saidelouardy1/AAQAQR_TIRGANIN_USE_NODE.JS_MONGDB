import 'package:aaqaqir_tirganin/app/Service/catigores.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aaqaqir_tirganin/app/model/Category.dart';

class HomeAdminController extends GetxController {
  var categories = <CategoryModel>[].obs;
  var isLoading = false.obs;
  
  final CategoryService _categoryService = CategoryService();

  @override
  void onInit() {
    super.onInit();
    loadCategoriesFromFirebase();
  }

  // جلب الفئات من Firebase
  Future<void> loadCategoriesFromFirebase() async {
    try {
      isLoading(true);
      final categoriesList = await _categoryService.getAllCategories();
      categories.assignAll(categoriesList);
    } catch (e) {
      print("Error loading categories: $e");
      Get.snackbar(
        'خطأ',
        'فشل في تحميل الفئات',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading(false);
    }
  }

  // إضافة فئة جديدة
  Future<void> addNewCategory() async {
    final TextEditingController nameController = TextEditingController();
    Get.defaultDialog(
      contentPadding: EdgeInsets.all(20),
      title: 'إضافة فئة جديدة',
      content: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              labelText: 'اسم الفئة',
              border: OutlineInputBorder(),
              hintText: 'أدخل اسم الفئة',
            ),
            autofocus: true,
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () async {
                    if (nameController.text.trim().isEmpty) {
                      Get.snackbar(
                        'خطأ', 
                        'يرجى إدخال اسم الفئة',
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                      );
                      return;
                    }
                    final newCategoryName = nameController.text.trim();
                    // التحقق من عدم تكرار الفئة
                    if (categories.any((cat) => cat.name == newCategoryName)) {
                      Get.snackbar(
                        'خطأ', 
                        'هذه الفئة موجودة مسبقاً',
                        backgroundColor: Colors.orange,
                        colorText: Colors.white,
                      );
                      return;
                    }
                    
                    try {
                      // إضافة الفئة إلى Firebase
                      final newCategory = CategoryModel(
                        id: '', // سيتم تعبئته تلقائياً من Firebase
                        name: newCategoryName,
                        productCount: 0,
                      );
                      
                      await _categoryService.addCategory(newCategory);
                      
                      Get.back();
                      Get.snackbar(
                        'تم الإضافة', 
                        'تم إضافة الفئة بنجاح',
                        backgroundColor: Colors.green,
                        colorText: Colors.white,
                      );
                      
                      // إعادة تحميل الفئات
                      await loadCategoriesFromFirebase();
                      
                    } catch (e) {
                      Get.snackbar(
                        'خطأ', 
                        'فشل في إضافة الفئة',
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
    );
  }

  // تعديل فئة موجودة
  Future<void> editCategory(int index) async {
    final category = categories[index];
    final TextEditingController nameController = 
        TextEditingController(text: category.name);
    
    Get.defaultDialog(
      title: 'تعديل الفئة',
      content: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              labelText: 'اسم الفئة',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () async {
                    if (nameController.text.trim().isEmpty) {
                      Get.snackbar(
                        'خطأ', 
                        'يرجى إدخال اسم الفئة',
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                      );
                      return;
                    }
                    
                    try {
                      // تحديث الفئة في Firebase
                      final updatedCategory = category.copyWith(
                        name: nameController.text.trim(),
                      );
                      
                      await _categoryService.updateCategory(updatedCategory);
                      
                      Get.back();
                      Get.snackbar(
                        'تم التعديل', 
                        'تم تعديل الفئة بنجاح',
                        backgroundColor: Colors.blue,
                        colorText: Colors.white,
                      );
                      
                      // إعادة تحميل الفئات
                      await loadCategoriesFromFirebase();
                      
                    } catch (e) {
                      Get.snackbar(
                        'خطأ', 
                        'فشل في تعديل الفئة',
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
    );
  }

  // حذف فئة
  Future<void> deleteCategory(int index) async {
    final category = categories[index];
    
    Get.defaultDialog(
      title: 'تأكيد الحذف',
      middleText: 'هل أنت متأكد من حذف ${category.name}؟',
      textConfirm: 'نعم',
      textCancel: 'لا',
      onConfirm: () async {
        try {
          await _categoryService.deleteCategory(category.id);
          
          Get.back();
          Get.snackbar(
            'تم الحذف', 
            'تم حذف الفئة بنجاح',
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
          
          // إعادة تحميل الفئات
          await loadCategoriesFromFirebase();
          
        } catch (e) {
          Get.snackbar(
            'خطأ', 
            'فشل في حذف الفئة',
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      },
    );
  }
}