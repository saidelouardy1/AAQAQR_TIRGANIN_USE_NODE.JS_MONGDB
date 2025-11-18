import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/category_products_view_admin_controller.dart';

class CategoryProductsViewAdminView extends GetView<CategoryProductsViewAdminController> {
  const CategoryProductsViewAdminView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(
          'منتجات ${controller.categoryName.value}',
          style: TextStyle(fontSize: 18),
        )),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: controller.addNewProduct,
            icon: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 20,
              ),
            ),
            tooltip: 'إضافة منتج جديد',
          )
        ],
      ),
      body: Obx(() {
        if (controller.products.isEmpty && !controller.isLoading.value) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.inventory_2,
                  size: 80,
                  color: Colors.grey[400],
                ),
                SizedBox(height: 16),
                Text(
                  'لا توجد منتجات',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'انقر على زر الإضافة لإنشاء منتج جديد',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          );
        }
        
        return RefreshIndicator(
          onRefresh: () async {
            // إعادة تحميل البيانات إذا لزم الأمر
            controller.products.refresh();
          },
          child: ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: controller.products.length,
            itemBuilder: (context, index) {
              final product = controller.products[index];
              return Card(
                elevation: 3,
                margin: EdgeInsets.only(bottom: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  leading: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: _getQuantityColor(product.quantity),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        '${product.quantity}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    product.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 4),
                      Text(
                        'السعر: ${product.price} د.ج',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.blue[700],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'الكمية: ${product.quantity}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () => controller.editProduct(index),
                        icon: Icon(Icons.edit, color: Colors.blue, size: 20),
                        tooltip: 'تعديل المنتج',
                      ),
                      IconButton(
                        onPressed: () => controller.deleteProduct(index),
                        icon: Icon(Icons.delete, color: Colors.red, size: 20),
                        tooltip: 'حذف المنتج',
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

  Color _getQuantityColor(int quantity) {
    if (quantity == 0) return Colors.red;
    if (quantity < 10) return Colors.orange;
    return Colors.green;
  }
}