// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_variant_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VariantOption _$VariantOptionFromJson(Map<String, dynamic> json) =>
    _VariantOption(
      label: json['label'] as String,
      priceAdd: (json['price_add'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$VariantOptionToJson(_VariantOption instance) =>
    <String, dynamic>{'label': instance.label, 'price_add': instance.priceAdd};

_ProductVariantModel _$ProductVariantModelFromJson(Map<String, dynamic> json) =>
    _ProductVariantModel(
      id: json['id'] as String,
      productId: json['product_id'] as String,
      name: json['name'] as String,
      options: (json['options'] as List<dynamic>)
          .map((e) => VariantOption.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductVariantModelToJson(
  _ProductVariantModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'product_id': instance.productId,
  'name': instance.name,
  'options': instance.options,
};
