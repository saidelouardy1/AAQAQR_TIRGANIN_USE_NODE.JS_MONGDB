import 'package:aaqaqir_tirganin/app/model/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/products_view_admin_controller.dart';

class ProductsViewAdminView extends GetView<ProductsViewAdminController> {
  const ProductsViewAdminView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(
          '${controller.categoryName.value} - المنتجات',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        )),
        centerTitle: true,
        backgroundColor: Colors.blue[700],
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: controller.addNewProduct,
            icon: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 22,
              ),
            ),
            tooltip: 'إضافة منتج جديد',
          )
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return _buildLoadingState();
        }

        if (controller.products.isEmpty) {
          return _buildEmptyState();
        }

        return _buildProductsList();
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
            'جاري تحميل المنتجات...',
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
            Icons.inventory_2_outlined,
            size: 80,
            color: Colors.grey[400],
          ),
          SizedBox(height: 16),
          Text(
            'لا توجد منتجات',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
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
          SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: controller.addNewProduct,
            icon: Icon(Icons.add),
            label: Text('إضافة منتج جديد'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue[700],
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductsList() {
    return RefreshIndicator(
      onRefresh: () => controller.loadProductsFromFirebase(),
      color: Colors.blue[700],
      child: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: controller.products.length,
        itemBuilder: (context, index) {
          final product = controller.products[index];
          return _buildProductCard(product, index);
        },
      ),
    );
  }

  Widget _buildProductCard(Product product, int index) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            // دائرة الكمية
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: _getQuantityColor(product.quantity),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: _getQuantityColor(product.quantity).withOpacity(0.3),
                  width: 2,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${product.quantity}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'قطعة',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 16),
            // معلومات المنتج
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(
                        Icons.attach_money,
                        size: 16,
                        color: Colors.blue[700],
                      ),
                      SizedBox(width: 4),
                      Text(
                        '${product.price.toStringAsFixed(2)} د.ج',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.blue[700],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2),
                  Row(
                    children: [
                      Icon(
                        Icons.inventory,
                        size: 14,
                        color: Colors.grey[600],
                      ),
                      SizedBox(width: 4),
                      Text(
                        'الكمية: ${product.quantity}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // أزرار الإجراءات
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () => controller.editProduct(index),
                  icon: Icon(
                    Icons.edit,
                    color: Colors.blue,
                    size: 22,
                  ),
                  tooltip: 'تعديل المنتج',
                ),
                IconButton(
                  onPressed: () => controller.deleteProduct(index),
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                    size: 22,
                  ),
                  tooltip: 'حذف المنتج',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _getQuantityColor(int quantity) {
    if (quantity == 0) return Colors.red;
    if (quantity < 5) return Colors.orange;
    if (quantity < 20) return Colors.amber;
    return Colors.green;
  }
}