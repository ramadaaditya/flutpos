// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CafeTableModel _$CafeTableModelFromJson(Map<String, dynamic> json) =>
    _CafeTableModel(
      id: json['id'] as String,
      number: (json['number'] as num).toInt(),
      name: json['name'] as String?,
      capacity: (json['capacity'] as num?)?.toInt() ?? 4,
      status:
          $enumDecodeNullable(_$TableStatusEnumMap, json['status']) ??
          TableStatus.available,
      floor: (json['floor'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$CafeTableModelToJson(_CafeTableModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'name': instance.name,
      'capacity': instance.capacity,
      'status': _$TableStatusEnumMap[instance.status]!,
      'floor': instance.floor,
    };

const _$TableStatusEnumMap = {
  TableStatus.available: 'available',
  TableStatus.occupied: 'occupied',
  TableStatus.reserved: 'reserved',
};
