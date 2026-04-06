// lib/features/product/data/models/product_model.dart
import 'package:flutpos/features/products/data/models/category_models.dart';
import 'package:flutpos/features/products/data/models/product_variant_models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_models.freezed.dart';
part 'product_models.g.dart';

@freezed
abstract class ProductModel with _$ProductModel {
  const factory ProductModel({
    required String id,
    required String name,
    String? description,
    @JsonKey(name: 'image_url') String? imageUrl,
    required double price,
    @JsonKey(name: 'cost_price') double? costPrice,
    @Default(0) int stock,
    @JsonKey(name: 'min_stock') @Default(5) int minStock,
    @JsonKey(name: 'unit') @Default('pcs') String unit,
    @JsonKey(name: 'category_id') String? categoryId,
    // Joined dari query
    @JsonKey(name: 'categories') CategoryModel? category,
    @JsonKey(name: 'product_variants')
    @Default([])
    List<ProductVariantModel> variants,
    @JsonKey(name: 'is_available') @Default(true) bool isAvailable,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  // Custom getters — tambahkan const constructor private
  const ProductModel._();

  bool get isLowStock => stock <= minStock;
  bool get isOutOfStock => stock == 0;
  double? get profitMargin => costPrice != null && costPrice! > 0
      ? ((price - costPrice!) / price) * 100
      : null;
}
