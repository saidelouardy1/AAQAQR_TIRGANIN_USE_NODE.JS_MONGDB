// lib/app/services/product_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:aaqaqir_tirganin/app/model/product.dart';

class ProductService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _collectionName = 'products';

  // جلب جميع منتجات فئة معينة
  Future<List<Product>> getProductsByCategory(String categoryId) async {
    try {
      final querySnapshot = await _firestore
          .collection(_collectionName)
          .where('categoryId', isEqualTo: categoryId)
          .orderBy('name')
          .get();
      
      return querySnapshot.docs.map((doc) {
        final data = doc.data();
        return Product(
          id: doc.id,
          categoryId: data['categoryId'] ?? '',
          name: data['name'] ?? '',
          price: (data['price'] ?? 0.0).toDouble(),
          quantity: data['quantity'] ?? 0,
        );
      }).toList();
    } catch (e) {
      print("Error getting products: $e");
      throw e;
    }
  }

  // إضافة منتج جديد
  Future<String> addProduct(Product product) async {
    try {
      final docRef = await _firestore.collection(_collectionName).add({
        'categoryId': product.categoryId,
        'name': product.name,
        'price': product.price,
        'quantity': product.quantity,
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      });
      return docRef.id;
    } catch (e) {
      print("Error adding product: $e");
      throw e;
    }
  }

  // تحديث منتج موجود
  Future<void> updateProduct(Product product) async {
    try {
      await _firestore.collection(_collectionName).doc(product.id).update({
        'name': product.name,
        'price': product.price,
        'quantity': product.quantity,
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print("Error updating product: $e");
      throw e;
    }
  }

  // حذف منتج
  Future<void> deleteProduct(String productId) async {
    try {
      await _firestore.collection(_collectionName).doc(productId).delete();
    } catch (e) {
      print("Error deleting product: $e");
      throw e;
    }
  }

  // جلب منتج بواسطة ID
  Future<Product?> getProductById(String productId) async {
    try {
      final doc = await _firestore.collection(_collectionName).doc(productId).get();
      if (doc.exists) {
        final data = doc.data()!;
        return Product(
          id: doc.id,
          categoryId: data['categoryId'] ?? '',
          name: data['name'] ?? '',
          price: (data['price'] ?? 0.0).toDouble(),
          quantity: data['quantity'] ?? 0,
        );
      }
      return null;
    } catch (e) {
      print("Error getting product by ID: $e");
      throw e;
    }
  }
}