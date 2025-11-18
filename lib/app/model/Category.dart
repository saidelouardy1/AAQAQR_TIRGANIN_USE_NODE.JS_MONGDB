import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String name;
  int productCount;
  
  CategoryModel({
    required this.id,
    required this.name,
    required this.productCount,
  });

  // تحويل الكائن إلى Map لـ Firebase
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'productCount': productCount,
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
    };
  }

  // إنشاء كائن من Map من Firebase
  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      productCount: map['productCount'] ?? 0,
    );
  }

  CategoryModel copyWith({
    String? id,
    String? name,
    int? productCount,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      productCount: productCount ?? this.productCount,
    );
  }
}