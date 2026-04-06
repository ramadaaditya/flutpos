import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_models.freezed.dart';
part 'customer_models.g.dart';

@freezed
abstract class CustomerModel with _$CustomerModel {
  const factory CustomerModel({
    required String id,
    required String name,
    String? email,
    String? phone,
    @JsonKey(name: 'loyalty_points') @Default(0) int loyaltyPoints,
    @JsonKey(name: 'total_spending') @Default(0) double totalSpending,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _CustomerModel;

  factory CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);
}
