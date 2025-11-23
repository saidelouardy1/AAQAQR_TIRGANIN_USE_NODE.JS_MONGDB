import 'package:aaqaqir_tirganin/app/model/Category.dart';
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
        backgroundColor: Colors.blue[700],
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: controller.addNewCategory,
            icon: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
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
          return _buildLoadingState();
        }

        if (controller.categories.isEmpty) {
          return _buildEmptyState();
        }

        return _buildCategoriesList();
      }),
    );
  }

  Widget _buildLoadingState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue[700]!),
          ),
          SizedBox(height: 16),
          Text(
            'جاري تحميل الفئات...',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.category_outlined,
            size: 80,
            color: Colors.grey[400],
          ),
          SizedBox(height: 16),
          Text(
            'لا توجد فئات',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 8),
          Text(
            'انقر على زر الإضافة لإنشاء فئة جديدة',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[500],
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: controller.addNewCategory,
            icon: Icon(Icons.add),
            label: Text('إضافة فئة جديدة'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue[700],
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoriesList() {
    return RefreshIndicator(
      onRefresh: () => controller.loadCategoriesFromFirebase(),
      color: Colors.blue[700],
      child: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: controller.categories.length,
        itemBuilder: (context, index) {
          final category = controller.categories[index];
          return _buildCategoryCard(category, index);
        },
      ),
    );
  }

  Widget _buildCategoryCard(CategoryModel category, int index) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {
          if (category.id.isNotEmpty) {
            Get.toNamed(
              Routes.PRODUCTS_VIEW_ADMIN,
              arguments: {
                'categoryId': category.id,
                'categoryName': category.name,
              },
            );
          }
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              // دائرة عدد المنتجات
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.blue[100]!, width: 2),
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
              SizedBox(width: 16),
              // معلومات الفئة
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '${category.productCount} منتج',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              // أزرار الإجراءات
              Row(
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
            ],
          ),
        ),
      ),
    );
  }
}