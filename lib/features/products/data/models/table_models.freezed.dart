// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'table_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CafeTableModel {

 String get id; int get number; String? get name; int get capacity; TableStatus get status; int get floor;
/// Create a copy of CafeTableModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CafeTableModelCopyWith<CafeTableModel> get copyWith => _$CafeTableModelCopyWithImpl<CafeTableModel>(this as CafeTableModel, _$identity);

  /// Serializes this CafeTableModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CafeTableModel&&(identical(other.id, id) || other.id == id)&&(identical(other.number, number) || other.number == number)&&(identical(other.name, name) || other.name == name)&&(identical(other.capacity, capacity) || other.capacity == capacity)&&(identical(other.status, status) || other.status == status)&&(identical(other.floor, floor) || other.floor == floor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,number,name,capacity,status,floor);

@override
String toString() {
  return 'CafeTableModel(id: $id, number: $number, name: $name, capacity: $capacity, status: $status, floor: $floor)';
}


}

/// @nodoc
abstract mixin class $CafeTableModelCopyWith<$Res>  {
  factory $CafeTableModelCopyWith(CafeTableModel value, $Res Function(CafeTableModel) _then) = _$CafeTableModelCopyWithImpl;
@useResult
$Res call({
 String id, int number, String? name, int capacity, TableStatus status, int floor
});




}
/// @nodoc
class _$CafeTableModelCopyWithImpl<$Res>
    implements $CafeTableModelCopyWith<$Res> {
  _$CafeTableModelCopyWithImpl(this._self, this._then);

  final CafeTableModel _self;
  final $Res Function(CafeTableModel) _then;

/// Create a copy of CafeTableModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? number = null,Object? name = freezed,Object? capacity = null,Object? status = null,Object? floor = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,capacity: null == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TableStatus,floor: null == floor ? _self.floor : floor // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CafeTableModel].
extension CafeTableModelPatterns on CafeTableModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CafeTableModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CafeTableModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CafeTableModel value)  $default,){
final _that = this;
switch (_that) {
case _CafeTableModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CafeTableModel value)?  $default,){
final _that = this;
switch (_that) {
case _CafeTableModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int number,  String? name,  int capacity,  TableStatus status,  int floor)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CafeTableModel() when $default != null:
return $default(_that.id,_that.number,_that.name,_that.capacity,_that.status,_that.floor);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int number,  String? name,  int capacity,  TableStatus status,  int floor)  $default,) {final _that = this;
switch (_that) {
case _CafeTableModel():
return $default(_that.id,_that.number,_that.name,_that.capacity,_that.status,_that.floor);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int number,  String? name,  int capacity,  TableStatus status,  int floor)?  $default,) {final _that = this;
switch (_that) {
case _CafeTableModel() when $default != null:
return $default(_that.id,_that.number,_that.name,_that.capacity,_that.status,_that.floor);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CafeTableModel implements CafeTableModel {
  const _CafeTableModel({required this.id, required this.number, this.name, this.capacity = 4, this.status = TableStatus.available, this.floor = 1});
  factory _CafeTableModel.fromJson(Map<String, dynamic> json) => _$CafeTableModelFromJson(json);

@override final  String id;
@override final  int number;
@override final  String? name;
@override@JsonKey() final  int capacity;
@override@JsonKey() final  TableStatus status;
@override@JsonKey() final  int floor;

/// Create a copy of CafeTableModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CafeTableModelCopyWith<_CafeTableModel> get copyWith => __$CafeTableModelCopyWithImpl<_CafeTableModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CafeTableModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CafeTableModel&&(identical(other.id, id) || other.id == id)&&(identical(other.number, number) || other.number == number)&&(identical(other.name, name) || other.name == name)&&(identical(other.capacity, capacity) || other.capacity == capacity)&&(identical(other.status, status) || other.status == status)&&(identical(other.floor, floor) || other.floor == floor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,number,name,capacity,status,floor);

@override
String toString() {
  return 'CafeTableModel(id: $id, number: $number, name: $name, capacity: $capacity, status: $status, floor: $floor)';
}


}

/// @nodoc
abstract mixin class _$CafeTableModelCopyWith<$Res> implements $CafeTableModelCopyWith<$Res> {
  factory _$CafeTableModelCopyWith(_CafeTableModel value, $Res Function(_CafeTableModel) _then) = __$CafeTableModelCopyWithImpl;
@override @useResult
$Res call({
 String id, int number, String? name, int capacity, TableStatus status, int floor
});




}
/// @nodoc
class __$CafeTableModelCopyWithImpl<$Res>
    implements _$CafeTableModelCopyWith<$Res> {
  __$CafeTableModelCopyWithImpl(this._self, this._then);

  final _CafeTableModel _self;
  final $Res Function(_CafeTableModel) _then;

/// Create a copy of CafeTableModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? number = null,Object? name = freezed,Object? capacity = null,Object? status = null,Object? floor = null,}) {
  return _then(_CafeTableModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,capacity: null == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TableStatus,floor: null == floor ? _self.floor : floor // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
