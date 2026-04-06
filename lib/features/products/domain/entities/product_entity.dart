import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final String id;
  final String name;
  final String? iconUrl;
  final int totalProductEntitys;

  const CategoryEntity({
    required this.id,
    required this.name,
    this.iconUrl,
    required this.totalProductEntitys,
  });

  @override
  List<Object?> get props => [id, name];
}

class Product extends Equatable {
  final String id;
  final String name;
  final String? description;
  final String? imageUrl;
  final String? barcode;
  final double price;
  final double? costPrice;
  final int stock;
  final int minStock;
  final String categoryId;
  final CategoryEntity? category;
  final ProductUnit unit;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Product({
    required this.id,
    required this.name,
    this.description,
    this.imageUrl,
    this.barcode,
    required this.price,
    this.costPrice,
    required this.stock,
    required this.minStock,
    required this.categoryId,
    this.category,
    required this.unit,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  bool get isLowStock => stock <= minStock;
  bool get isOutOfStock => stock == 0;

  double? get profitMargin {
    if (costPrice == null || costPrice == 0) return null;
    return ((price - costPrice!) / price) * 100;
  }

  @override
  List<Object> get props => [id, name, price, stock];
}

enum ProductUnit { pcs, kg, gram, liter, ml, box, pack, dozen }

extension ProductUnitLabel on ProductUnit {
  String get label {
    switch (this) {
      case ProductUnit.pcs:
        return 'Pcs';
      case ProductUnit.kg:
        return 'Kg';
      case ProductUnit.gram:
        return 'Gram';
      case ProductUnit.liter:
        return 'Liter';
      case ProductUnit.ml:
        return 'Ml';
      case ProductUnit.box:
        return 'Box';
      case ProductUnit.pack:
        return 'Pack';
      case ProductUnit.dozen:
        return 'Dozen';
    }
  }
}
