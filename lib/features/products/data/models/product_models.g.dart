// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductModel _$ProductModelFromJson(Map<String, dynamic> json) =>
    _ProductModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      imageUrl: json['image_url'] as String?,
      price: (json['price'] as num).toDouble(),
      costPrice: (json['cost_price'] as num?)?.toDouble(),
      stock: (json['stock'] as num?)?.toInt() ?? 0,
      minStock: (json['min_stock'] as num?)?.toInt() ?? 5,
      unit: json['unit'] as String? ?? 'pcs',
      categoryId: json['category_id'] as String?,
      category: json['categories'] == null
          ? null
          : CategoryModel.fromJson(json['categories'] as Map<String, dynamic>),
      variants:
          (json['product_variants'] as List<dynamic>?)
              ?.map(
                (e) => ProductVariantModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
      isAvailable: json['is_available'] as bool? ?? true,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$ProductModelToJson(_ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image_url': instance.imageUrl,
      'price': instance.price,
      'cost_price': instance.costPrice,
      'stock': instance.stock,
      'min_stock': instance.minStock,
      'unit': instance.unit,
      'category_id': instance.categoryId,
      'categories': instance.category,
      'product_variants': instance.variants,
      'is_available': instance.isAvailable,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
