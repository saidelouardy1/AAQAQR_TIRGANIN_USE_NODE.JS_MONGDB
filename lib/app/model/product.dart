// lib/app/model/product.dart
class Product {
  final String id;
  final String categoryId;
  final String name;
  final double price;
  final int quantity;
  
  Product({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.price,
    required this.quantity,
  });

  // نسخة من الكائن
  Product copyWith({
    String? id,
    String? categoryId,
    String? name,
    double? price,
    int? quantity,
  }) {
    return Product(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }
}