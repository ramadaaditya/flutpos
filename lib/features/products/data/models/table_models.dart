// lib/features/table/data/models/table_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'table_models.freezed.dart';
part 'table_models.g.dart';

@freezed
abstract class CafeTableModel with _$CafeTableModel {
  const factory CafeTableModel({
    required String id,
    required int number,
    String? name,
    @Default(4) int capacity,
    @Default(TableStatus.available) TableStatus status,
    @Default(1) int floor,
  }) = _CafeTableModel;

  factory CafeTableModel.fromJson(Map<String, dynamic> json) =>
      _$CafeTableModelFromJson(json);
}

enum TableStatus {
  @JsonValue('available')
  available,
  @JsonValue('occupied')
  occupied,
  @JsonValue('reserved')
  reserved,
}
