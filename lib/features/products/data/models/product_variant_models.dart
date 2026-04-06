// lib/features/product/data/models/product_variant_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_variant_models.freezed.dart';
part 'product_variant_models.g.dart';

@freezed
abstract class VariantOption with _$VariantOption {
  const factory VariantOption({
    required String label,
    @JsonKey(name: 'price_add') @Default(0) double priceAdd,
  }) = _VariantOption;

  factory VariantOption.fromJson(Map<String, dynamic> json) =>
      _$VariantOptionFromJson(json);
}

@freezed
abstract class ProductVariantModel with _$ProductVariantModel {
  const factory ProductVariantModel({
    required String id,
    @JsonKey(name: 'product_id') required String productId,
    required String name,
    required List<VariantOption> options,
  }) = _ProductVariantModel;

  factory ProductVariantModel.fromJson(Map<String, dynamic> json) =>
      _$ProductVariantModelFromJson(json);
}
