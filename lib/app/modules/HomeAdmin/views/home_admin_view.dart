import 'package:aaqaqir_tirganin/app/modules/CategoryProductsViewAdmin/controllers/category_products_view_admin_controller.dart';
import 'package:aaqaqir_tirganin/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_admin_controller.dart';

class HomeAdminView extends GetView<HomeAdminController> {
  const HomeAdminView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('إدارة الفئات'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: controller.addNewCategory,
            icon: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(Icons.add, color: Colors.white, size: 24),
            ),
            tooltip: 'إضافة فئة جديدة',
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text('جاري تحميل الفئات...'),
              ],
            ),
          );
        }

        if (controller.categories.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.category, size: 80, color: Colors.grey[400]),
                SizedBox(height: 16),
                Text(
                  'لا توجد فئات',
                  style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                ),
                SizedBox(height: 8),
                Text(
                  'انقر على زر الإضافة لإنشاء فئة جديدة',
                  style: TextStyle(fontSize: 14, color: Colors.grey[500]),
                ),
              ],
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () => controller.loadCategoriesFromFirebase(),
          child: ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: controller.categories.length,
            itemBuilder: (context, index) {
              final category = controller.categories[index];
              return Card(
                elevation: 3,
                margin: EdgeInsets.only(bottom: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  onTap: () {
                    if (category.id.isNotEmpty) {
                      //    final categoryProductsViewAdminController = Get.put(CategoryProductsViewAdminController());
                      //   categoryProductsViewAdminController.categoryName.value = category.name;
                      //   categoryProductsViewAdminController.categoryId.value = category.id;
                      //  Get.toNamed(Routes.CATEGORY_PRODUCTS_VIEW_ADMIN);
                      Get.toNamed(
                        Routes.CATEGORY_PRODUCTS_VIEW_ADMIN,
                        arguments: {
                          'categoryId': category.id,
                          'categoryName': category.name,
                        },
                      );
                    }
                  },
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  leading: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        '${category.productCount}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[700],
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    category.name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    '${category.productCount} منتج',
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () => controller.editCategory(index),
                        icon: Icon(Icons.edit, color: Colors.blue),
                        tooltip: 'تعديل الفئة',
                      ),
                      IconButton(
                        onPressed: () => controller.deleteCategory(index),
                        icon: Icon(Icons.delete, color: Colors.red),
                        tooltip: 'حذف الفئة',
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
