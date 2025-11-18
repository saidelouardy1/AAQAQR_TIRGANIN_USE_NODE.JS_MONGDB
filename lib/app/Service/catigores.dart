// lib/app/services/category_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:aaqaqir_tirganin/app/model/Category.dart';

class CategoryService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _collectionName = 'categories';

  // جلب جميع الفئات
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final querySnapshot = await _firestore
          .collection(_collectionName)
          .orderBy('name')
          .get();
      
      return querySnapshot.docs.map((doc) {
        final data = doc.data();
        return CategoryModel(
          id: doc.id,
          name: data['name'] ?? '',
          productCount: data['productCount'] ?? 0,
        );
      }).toList();
    } catch (e) {
      print("Error getting categories: $e");
      throw e;
    }
  }

  // إضافة فئة جديدة
  Future<void> addCategory(CategoryModel category) async {
    try {
      await _firestore.collection(_collectionName).add({
        'name': category.name,
        'productCount': 0,
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print("Error adding category: $e");
      throw e;
    }
  }

  // تحديث فئة موجودة
  Future<void> updateCategory(CategoryModel category) async {
    try {
      await _firestore.collection(_collectionName).doc(category.id).update({
        'name': category.name,
        'productCount': category.productCount,
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print("Error updating category: $e");
      throw e;
    }
  }

  // حذف فئة
  Future<void> deleteCategory(String categoryId) async {
    try {
      await _firestore.collection(_collectionName).doc(categoryId).delete();
    } catch (e) {
      print("Error deleting category: $e");
      throw e;
    }
  }

  // جلب فئة بواسطة ID
  Future<CategoryModel?> getCategoryById(String categoryId) async {
    try {
      final doc = await _firestore.collection(_collectionName).doc(categoryId).get();
      if (doc.exists) {
        final data = doc.data()!;
        return CategoryModel(
          id: doc.id,
          name: data['name'] ?? '',
          productCount: data['productCount'] ?? 0,
        );
      }
      return null;
    } catch (e) {
      print("Error getting category by ID: $e");
      throw e;
    }
  }
}