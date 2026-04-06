// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_item_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TransactionItemModel {

 String? get id;@JsonKey(name: 'transaction_id') String? get transactionId;@JsonKey(name: 'product_id') String get productId;@JsonKey(name: 'product_name') String get productName;@JsonKey(name: 'unit_price') double get unitPrice; int get quantity; Map<String, dynamic>? get variants;// {"Ukuran": "Large", "Suhu": "Ice"}
@JsonKey(name: 'discount_amount') double get discountAmount; double get subtotal; String? get note;
/// Create a copy of TransactionItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionItemModelCopyWith<TransactionItemModel> get copyWith => _$TransactionItemModelCopyWithImpl<TransactionItemModel>(this as TransactionItemModel, _$identity);

  /// Serializes this TransactionItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&const DeepCollectionEquality().equals(other.variants, variants)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,transactionId,productId,productName,unitPrice,quantity,const DeepCollectionEquality().hash(variants),discountAmount,subtotal,note);

@override
String toString() {
  return 'TransactionItemModel(id: $id, transactionId: $transactionId, productId: $productId, productName: $productName, unitPrice: $unitPrice, quantity: $quantity, variants: $variants, discountAmount: $discountAmount, subtotal: $subtotal, note: $note)';
}


}

/// @nodoc
abstract mixin class $TransactionItemModelCopyWith<$Res>  {
  factory $TransactionItemModelCopyWith(TransactionItemModel value, $Res Function(TransactionItemModel) _then) = _$TransactionItemModelCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'transaction_id') String? transactionId,@JsonKey(name: 'product_id') String productId,@JsonKey(name: 'product_name') String productName,@JsonKey(name: 'unit_price') double unitPrice, int quantity, Map<String, dynamic>? variants,@JsonKey(name: 'discount_amount') double discountAmount, double subtotal, String? note
});




}
/// @nodoc
class _$TransactionItemModelCopyWithImpl<$Res>
    implements $TransactionItemModelCopyWith<$Res> {
  _$TransactionItemModelCopyWithImpl(this._self, this._then);

  final TransactionItemModel _self;
  final $Res Function(TransactionItemModel) _then;

/// Create a copy of TransactionItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? transactionId = freezed,Object? productId = null,Object? productName = null,Object? unitPrice = null,Object? quantity = null,Object? variants = freezed,Object? discountAmount = null,Object? subtotal = null,Object? note = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,transactionId: freezed == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String?,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,variants: freezed == variants ? _self.variants : variants // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,discountAmount: null == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as double,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TransactionItemModel].
extension TransactionItemModelPatterns on TransactionItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionItemModel value)  $default,){
final _that = this;
switch (_that) {
case _TransactionItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'transaction_id')  String? transactionId, @JsonKey(name: 'product_id')  String productId, @JsonKey(name: 'product_name')  String productName, @JsonKey(name: 'unit_price')  double unitPrice,  int quantity,  Map<String, dynamic>? variants, @JsonKey(name: 'discount_amount')  double discountAmount,  double subtotal,  String? note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionItemModel() when $default != null:
return $default(_that.id,_that.transactionId,_that.productId,_that.productName,_that.unitPrice,_that.quantity,_that.variants,_that.discountAmount,_that.subtotal,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'transaction_id')  String? transactionId, @JsonKey(name: 'product_id')  String productId, @JsonKey(name: 'product_name')  String productName, @JsonKey(name: 'unit_price')  double unitPrice,  int quantity,  Map<String, dynamic>? variants, @JsonKey(name: 'discount_amount')  double discountAmount,  double subtotal,  String? note)  $default,) {final _that = this;
switch (_that) {
case _TransactionItemModel():
return $default(_that.id,_that.transactionId,_that.productId,_that.productName,_that.unitPrice,_that.quantity,_that.variants,_that.discountAmount,_that.subtotal,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'transaction_id')  String? transactionId, @JsonKey(name: 'product_id')  String productId, @JsonKey(name: 'product_name')  String productName, @JsonKey(name: 'unit_price')  double unitPrice,  int quantity,  Map<String, dynamic>? variants, @JsonKey(name: 'discount_amount')  double discountAmount,  double subtotal,  String? note)?  $default,) {final _that = this;
switch (_that) {
case _TransactionItemModel() when $default != null:
return $default(_that.id,_that.transactionId,_that.productId,_that.productName,_that.unitPrice,_that.quantity,_that.variants,_that.discountAmount,_that.subtotal,_that.note);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransactionItemModel implements TransactionItemModel {
  const _TransactionItemModel({this.id, @JsonKey(name: 'transaction_id') this.transactionId, @JsonKey(name: 'product_id') required this.productId, @JsonKey(name: 'product_name') required this.productName, @JsonKey(name: 'unit_price') required this.unitPrice, required this.quantity, final  Map<String, dynamic>? variants, @JsonKey(name: 'discount_amount') this.discountAmount = 0, required this.subtotal, this.note}): _variants = variants;
  factory _TransactionItemModel.fromJson(Map<String, dynamic> json) => _$TransactionItemModelFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'transaction_id') final  String? transactionId;
@override@JsonKey(name: 'product_id') final  String productId;
@override@JsonKey(name: 'product_name') final  String productName;
@override@JsonKey(name: 'unit_price') final  double unitPrice;
@override final  int quantity;
 final  Map<String, dynamic>? _variants;
@override Map<String, dynamic>? get variants {
  final value = _variants;
  if (value == null) return null;
  if (_variants is EqualUnmodifiableMapView) return _variants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

// {"Ukuran": "Large", "Suhu": "Ice"}
@override@JsonKey(name: 'discount_amount') final  double discountAmount;
@override final  double subtotal;
@override final  String? note;

/// Create a copy of TransactionItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionItemModelCopyWith<_TransactionItemModel> get copyWith => __$TransactionItemModelCopyWithImpl<_TransactionItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransactionItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&const DeepCollectionEquality().equals(other._variants, _variants)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,transactionId,productId,productName,unitPrice,quantity,const DeepCollectionEquality().hash(_variants),discountAmount,subtotal,note);

@override
String toString() {
  return 'TransactionItemModel(id: $id, transactionId: $transactionId, productId: $productId, productName: $productName, unitPrice: $unitPrice, quantity: $quantity, variants: $variants, discountAmount: $discountAmount, subtotal: $subtotal, note: $note)';
}


}

/// @nodoc
abstract mixin class _$TransactionItemModelCopyWith<$Res> implements $TransactionItemModelCopyWith<$Res> {
  factory _$TransactionItemModelCopyWith(_TransactionItemModel value, $Res Function(_TransactionItemModel) _then) = __$TransactionItemModelCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'transaction_id') String? transactionId,@JsonKey(name: 'product_id') String productId,@JsonKey(name: 'product_name') String productName,@JsonKey(name: 'unit_price') double unitPrice, int quantity, Map<String, dynamic>? variants,@JsonKey(name: 'discount_amount') double discountAmount, double subtotal, String? note
});




}
/// @nodoc
class __$TransactionItemModelCopyWithImpl<$Res>
    implements _$TransactionItemModelCopyWith<$Res> {
  __$TransactionItemModelCopyWithImpl(this._self, this._then);

  final _TransactionItemModel _self;
  final $Res Function(_TransactionItemModel) _then;

/// Create a copy of TransactionItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? transactionId = freezed,Object? productId = null,Object? productName = null,Object? unitPrice = null,Object? quantity = null,Object? variants = freezed,Object? discountAmount = null,Object? subtotal = null,Object? note = freezed,}) {
  return _then(_TransactionItemModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,transactionId: freezed == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String?,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,variants: freezed == variants ? _self._variants : variants // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,discountAmount: null == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as double,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$TransactionModel {

 String? get id;@JsonKey(name: 'invoice_number') String? get invoiceNumber;@JsonKey(name: 'table_id') String? get tableId;@JsonKey(name: 'customer_id') String? get customerId;@JsonKey(name: 'cashier_id') String? get cashierId;@JsonKey(name: 'order_type') OrderType get orderType; double get subtotal;@JsonKey(name: 'discount_amount') double get discountAmount;@JsonKey(name: 'tax_amount') double get taxAmount;@JsonKey(name: 'grand_total') double get grandTotal;@JsonKey(name: 'payment_method') PaymentMethod? get paymentMethod;@JsonKey(name: 'total_paid') double? get totalPaid;@JsonKey(name: 'change_amount') double get changeAmount; TransactionStatus get status; String? get note;@JsonKey(name: 'created_at') DateTime? get createdAt;// Joined
@JsonKey(name: 'transaction_items') List<TransactionItemModel> get items;@JsonKey(name: 'cafe_tables') CafeTableModel? get table;@JsonKey(name: 'customers') CustomerModel? get customer;
/// Create a copy of TransactionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionModelCopyWith<TransactionModel> get copyWith => _$TransactionModelCopyWithImpl<TransactionModel>(this as TransactionModel, _$identity);

  /// Serializes this TransactionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.invoiceNumber, invoiceNumber) || other.invoiceNumber == invoiceNumber)&&(identical(other.tableId, tableId) || other.tableId == tableId)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.cashierId, cashierId) || other.cashierId == cashierId)&&(identical(other.orderType, orderType) || other.orderType == orderType)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.taxAmount, taxAmount) || other.taxAmount == taxAmount)&&(identical(other.grandTotal, grandTotal) || other.grandTotal == grandTotal)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.totalPaid, totalPaid) || other.totalPaid == totalPaid)&&(identical(other.changeAmount, changeAmount) || other.changeAmount == changeAmount)&&(identical(other.status, status) || other.status == status)&&(identical(other.note, note) || other.note == note)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.table, table) || other.table == table)&&(identical(other.customer, customer) || other.customer == customer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,invoiceNumber,tableId,customerId,cashierId,orderType,subtotal,discountAmount,taxAmount,grandTotal,paymentMethod,totalPaid,changeAmount,status,note,createdAt,const DeepCollectionEquality().hash(items),table,customer]);

@override
String toString() {
  return 'TransactionModel(id: $id, invoiceNumber: $invoiceNumber, tableId: $tableId, customerId: $customerId, cashierId: $cashierId, orderType: $orderType, subtotal: $subtotal, discountAmount: $discountAmount, taxAmount: $taxAmount, grandTotal: $grandTotal, paymentMethod: $paymentMethod, totalPaid: $totalPaid, changeAmount: $changeAmount, status: $status, note: $note, createdAt: $createdAt, items: $items, table: $table, customer: $customer)';
}


}

/// @nodoc
abstract mixin class $TransactionModelCopyWith<$Res>  {
  factory $TransactionModelCopyWith(TransactionModel value, $Res Function(TransactionModel) _then) = _$TransactionModelCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'invoice_number') String? invoiceNumber,@JsonKey(name: 'table_id') String? tableId,@JsonKey(name: 'customer_id') String? customerId,@JsonKey(name: 'cashier_id') String? cashierId,@JsonKey(name: 'order_type') OrderType orderType, double subtotal,@JsonKey(name: 'discount_amount') double discountAmount,@JsonKey(name: 'tax_amount') double taxAmount,@JsonKey(name: 'grand_total') double grandTotal,@JsonKey(name: 'payment_method') PaymentMethod? paymentMethod,@JsonKey(name: 'total_paid') double? totalPaid,@JsonKey(name: 'change_amount') double changeAmount, TransactionStatus status, String? note,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'transaction_items') List<TransactionItemModel> items,@JsonKey(name: 'cafe_tables') CafeTableModel? table,@JsonKey(name: 'customers') CustomerModel? customer
});


$CafeTableModelCopyWith<$Res>? get table;$CustomerModelCopyWith<$Res>? get customer;

}
/// @nodoc
class _$TransactionModelCopyWithImpl<$Res>
    implements $TransactionModelCopyWith<$Res> {
  _$TransactionModelCopyWithImpl(this._self, this._then);

  final TransactionModel _self;
  final $Res Function(TransactionModel) _then;

/// Create a copy of TransactionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? invoiceNumber = freezed,Object? tableId = freezed,Object? customerId = freezed,Object? cashierId = freezed,Object? orderType = null,Object? subtotal = null,Object? discountAmount = null,Object? taxAmount = null,Object? grandTotal = null,Object? paymentMethod = freezed,Object? totalPaid = freezed,Object? changeAmount = null,Object? status = null,Object? note = freezed,Object? createdAt = freezed,Object? items = null,Object? table = freezed,Object? customer = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,invoiceNumber: freezed == invoiceNumber ? _self.invoiceNumber : invoiceNumber // ignore: cast_nullable_to_non_nullable
as String?,tableId: freezed == tableId ? _self.tableId : tableId // ignore: cast_nullable_to_non_nullable
as String?,customerId: freezed == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as String?,cashierId: freezed == cashierId ? _self.cashierId : cashierId // ignore: cast_nullable_to_non_nullable
as String?,orderType: null == orderType ? _self.orderType : orderType // ignore: cast_nullable_to_non_nullable
as OrderType,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,discountAmount: null == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as double,taxAmount: null == taxAmount ? _self.taxAmount : taxAmount // ignore: cast_nullable_to_non_nullable
as double,grandTotal: null == grandTotal ? _self.grandTotal : grandTotal // ignore: cast_nullable_to_non_nullable
as double,paymentMethod: freezed == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as PaymentMethod?,totalPaid: freezed == totalPaid ? _self.totalPaid : totalPaid // ignore: cast_nullable_to_non_nullable
as double?,changeAmount: null == changeAmount ? _self.changeAmount : changeAmount // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TransactionStatus,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<TransactionItemModel>,table: freezed == table ? _self.table : table // ignore: cast_nullable_to_non_nullable
as CafeTableModel?,customer: freezed == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as CustomerModel?,
  ));
}
/// Create a copy of TransactionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CafeTableModelCopyWith<$Res>? get table {
    if (_self.table == null) {
    return null;
  }

  return $CafeTableModelCopyWith<$Res>(_self.table!, (value) {
    return _then(_self.copyWith(table: value));
  });
}/// Create a copy of TransactionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CustomerModelCopyWith<$Res>? get customer {
    if (_self.customer == null) {
    return null;
  }

  return $CustomerModelCopyWith<$Res>(_self.customer!, (value) {
    return _then(_self.copyWith(customer: value));
  });
}
}


/// Adds pattern-matching-related methods to [TransactionModel].
extension TransactionModelPatterns on TransactionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionModel value)  $default,){
final _that = this;
switch (_that) {
case _TransactionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionModel value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'invoice_number')  String? invoiceNumber, @JsonKey(name: 'table_id')  String? tableId, @JsonKey(name: 'customer_id')  String? customerId, @JsonKey(name: 'cashier_id')  String? cashierId, @JsonKey(name: 'order_type')  OrderType orderType,  double subtotal, @JsonKey(name: 'discount_amount')  double discountAmount, @JsonKey(name: 'tax_amount')  double taxAmount, @JsonKey(name: 'grand_total')  double grandTotal, @JsonKey(name: 'payment_method')  PaymentMethod? paymentMethod, @JsonKey(name: 'total_paid')  double? totalPaid, @JsonKey(name: 'change_amount')  double changeAmount,  TransactionStatus status,  String? note, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'transaction_items')  List<TransactionItemModel> items, @JsonKey(name: 'cafe_tables')  CafeTableModel? table, @JsonKey(name: 'customers')  CustomerModel? customer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionModel() when $default != null:
return $default(_that.id,_that.invoiceNumber,_that.tableId,_that.customerId,_that.cashierId,_that.orderType,_that.subtotal,_that.discountAmount,_that.taxAmount,_that.grandTotal,_that.paymentMethod,_that.totalPaid,_that.changeAmount,_that.status,_that.note,_that.createdAt,_that.items,_that.table,_that.customer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'invoice_number')  String? invoiceNumber, @JsonKey(name: 'table_id')  String? tableId, @JsonKey(name: 'customer_id')  String? customerId, @JsonKey(name: 'cashier_id')  String? cashierId, @JsonKey(name: 'order_type')  OrderType orderType,  double subtotal, @JsonKey(name: 'discount_amount')  double discountAmount, @JsonKey(name: 'tax_amount')  double taxAmount, @JsonKey(name: 'grand_total')  double grandTotal, @JsonKey(name: 'payment_method')  PaymentMethod? paymentMethod, @JsonKey(name: 'total_paid')  double? totalPaid, @JsonKey(name: 'change_amount')  double changeAmount,  TransactionStatus status,  String? note, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'transaction_items')  List<TransactionItemModel> items, @JsonKey(name: 'cafe_tables')  CafeTableModel? table, @JsonKey(name: 'customers')  CustomerModel? customer)  $default,) {final _that = this;
switch (_that) {
case _TransactionModel():
return $default(_that.id,_that.invoiceNumber,_that.tableId,_that.customerId,_that.cashierId,_that.orderType,_that.subtotal,_that.discountAmount,_that.taxAmount,_that.grandTotal,_that.paymentMethod,_that.totalPaid,_that.changeAmount,_that.status,_that.note,_that.createdAt,_that.items,_that.table,_that.customer);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'invoice_number')  String? invoiceNumber, @JsonKey(name: 'table_id')  String? tableId, @JsonKey(name: 'customer_id')  String? customerId, @JsonKey(name: 'cashier_id')  String? cashierId, @JsonKey(name: 'order_type')  OrderType orderType,  double subtotal, @JsonKey(name: 'discount_amount')  double discountAmount, @JsonKey(name: 'tax_amount')  double taxAmount, @JsonKey(name: 'grand_total')  double grandTotal, @JsonKey(name: 'payment_method')  PaymentMethod? paymentMethod, @JsonKey(name: 'total_paid')  double? totalPaid, @JsonKey(name: 'change_amount')  double changeAmount,  TransactionStatus status,  String? note, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'transaction_items')  List<TransactionItemModel> items, @JsonKey(name: 'cafe_tables')  CafeTableModel? table, @JsonKey(name: 'customers')  CustomerModel? customer)?  $default,) {final _that = this;
switch (_that) {
case _TransactionModel() when $default != null:
return $default(_that.id,_that.invoiceNumber,_that.tableId,_that.customerId,_that.cashierId,_that.orderType,_that.subtotal,_that.discountAmount,_that.taxAmount,_that.grandTotal,_that.paymentMethod,_that.totalPaid,_that.changeAmount,_that.status,_that.note,_that.createdAt,_that.items,_that.table,_that.customer);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransactionModel implements TransactionModel {
  const _TransactionModel({this.id, @JsonKey(name: 'invoice_number') this.invoiceNumber, @JsonKey(name: 'table_id') this.tableId, @JsonKey(name: 'customer_id') this.customerId, @JsonKey(name: 'cashier_id') this.cashierId, @JsonKey(name: 'order_type') required this.orderType, required this.subtotal, @JsonKey(name: 'discount_amount') this.discountAmount = 0, @JsonKey(name: 'tax_amount') this.taxAmount = 0, @JsonKey(name: 'grand_total') required this.grandTotal, @JsonKey(name: 'payment_method') this.paymentMethod, @JsonKey(name: 'total_paid') this.totalPaid, @JsonKey(name: 'change_amount') this.changeAmount = 0, this.status = TransactionStatus.pending, this.note, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'transaction_items') final  List<TransactionItemModel> items = const [], @JsonKey(name: 'cafe_tables') this.table, @JsonKey(name: 'customers') this.customer}): _items = items;
  factory _TransactionModel.fromJson(Map<String, dynamic> json) => _$TransactionModelFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'invoice_number') final  String? invoiceNumber;
@override@JsonKey(name: 'table_id') final  String? tableId;
@override@JsonKey(name: 'customer_id') final  String? customerId;
@override@JsonKey(name: 'cashier_id') final  String? cashierId;
@override@JsonKey(name: 'order_type') final  OrderType orderType;
@override final  double subtotal;
@override@JsonKey(name: 'discount_amount') final  double discountAmount;
@override@JsonKey(name: 'tax_amount') final  double taxAmount;
@override@JsonKey(name: 'grand_total') final  double grandTotal;
@override@JsonKey(name: 'payment_method') final  PaymentMethod? paymentMethod;
@override@JsonKey(name: 'total_paid') final  double? totalPaid;
@override@JsonKey(name: 'change_amount') final  double changeAmount;
@override@JsonKey() final  TransactionStatus status;
@override final  String? note;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
// Joined
 final  List<TransactionItemModel> _items;
// Joined
@override@JsonKey(name: 'transaction_items') List<TransactionItemModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey(name: 'cafe_tables') final  CafeTableModel? table;
@override@JsonKey(name: 'customers') final  CustomerModel? customer;

/// Create a copy of TransactionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionModelCopyWith<_TransactionModel> get copyWith => __$TransactionModelCopyWithImpl<_TransactionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransactionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.invoiceNumber, invoiceNumber) || other.invoiceNumber == invoiceNumber)&&(identical(other.tableId, tableId) || other.tableId == tableId)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.cashierId, cashierId) || other.cashierId == cashierId)&&(identical(other.orderType, orderType) || other.orderType == orderType)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.taxAmount, taxAmount) || other.taxAmount == taxAmount)&&(identical(other.grandTotal, grandTotal) || other.grandTotal == grandTotal)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.totalPaid, totalPaid) || other.totalPaid == totalPaid)&&(identical(other.changeAmount, changeAmount) || other.changeAmount == changeAmount)&&(identical(other.status, status) || other.status == status)&&(identical(other.note, note) || other.note == note)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.table, table) || other.table == table)&&(identical(other.customer, customer) || other.customer == customer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,invoiceNumber,tableId,customerId,cashierId,orderType,subtotal,discountAmount,taxAmount,grandTotal,paymentMethod,totalPaid,changeAmount,status,note,createdAt,const DeepCollectionEquality().hash(_items),table,customer]);

@override
String toString() {
  return 'TransactionModel(id: $id, invoiceNumber: $invoiceNumber, tableId: $tableId, customerId: $customerId, cashierId: $cashierId, orderType: $orderType, subtotal: $subtotal, discountAmount: $discountAmount, taxAmount: $taxAmount, grandTotal: $grandTotal, paymentMethod: $paymentMethod, totalPaid: $totalPaid, changeAmount: $changeAmount, status: $status, note: $note, createdAt: $createdAt, items: $items, table: $table, customer: $customer)';
}


}

/// @nodoc
abstract mixin class _$TransactionModelCopyWith<$Res> implements $TransactionModelCopyWith<$Res> {
  factory _$TransactionModelCopyWith(_TransactionModel value, $Res Function(_TransactionModel) _then) = __$TransactionModelCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'invoice_number') String? invoiceNumber,@JsonKey(name: 'table_id') String? tableId,@JsonKey(name: 'customer_id') String? customerId,@JsonKey(name: 'cashier_id') String? cashierId,@JsonKey(name: 'order_type') OrderType orderType, double subtotal,@JsonKey(name: 'discount_amount') double discountAmount,@JsonKey(name: 'tax_amount') double taxAmount,@JsonKey(name: 'grand_total') double grandTotal,@JsonKey(name: 'payment_method') PaymentMethod? paymentMethod,@JsonKey(name: 'total_paid') double? totalPaid,@JsonKey(name: 'change_amount') double changeAmount, TransactionStatus status, String? note,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'transaction_items') List<TransactionItemModel> items,@JsonKey(name: 'cafe_tables') CafeTableModel? table,@JsonKey(name: 'customers') CustomerModel? customer
});


@override $CafeTableModelCopyWith<$Res>? get table;@override $CustomerModelCopyWith<$Res>? get customer;

}
/// @nodoc
class __$TransactionModelCopyWithImpl<$Res>
    implements _$TransactionModelCopyWith<$Res> {
  __$TransactionModelCopyWithImpl(this._self, this._then);

  final _TransactionModel _self;
  final $Res Function(_TransactionModel) _then;

/// Create a copy of TransactionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? invoiceNumber = freezed,Object? tableId = freezed,Object? customerId = freezed,Object? cashierId = freezed,Object? orderType = null,Object? subtotal = null,Object? discountAmount = null,Object? taxAmount = null,Object? grandTotal = null,Object? paymentMethod = freezed,Object? totalPaid = freezed,Object? changeAmount = null,Object? status = null,Object? note = freezed,Object? createdAt = freezed,Object? items = null,Object? table = freezed,Object? customer = freezed,}) {
  return _then(_TransactionModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,invoiceNumber: freezed == invoiceNumber ? _self.invoiceNumber : invoiceNumber // ignore: cast_nullable_to_non_nullable
as String?,tableId: freezed == tableId ? _self.tableId : tableId // ignore: cast_nullable_to_non_nullable
as String?,customerId: freezed == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as String?,cashierId: freezed == cashierId ? _self.cashierId : cashierId // ignore: cast_nullable_to_non_nullable
as String?,orderType: null == orderType ? _self.orderType : orderType // ignore: cast_nullable_to_non_nullable
as OrderType,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,discountAmount: null == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as double,taxAmount: null == taxAmount ? _self.taxAmount : taxAmount // ignore: cast_nullable_to_non_nullable
as double,grandTotal: null == grandTotal ? _self.grandTotal : grandTotal // ignore: cast_nullable_to_non_nullable
as double,paymentMethod: freezed == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as PaymentMethod?,totalPaid: freezed == totalPaid ? _self.totalPaid : totalPaid // ignore: cast_nullable_to_non_nullable
as double?,changeAmount: null == changeAmount ? _self.changeAmount : changeAmount // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TransactionStatus,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<TransactionItemModel>,table: freezed == table ? _self.table : table // ignore: cast_nullable_to_non_nullable
as CafeTableModel?,customer: freezed == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as CustomerModel?,
  ));
}

/// Create a copy of TransactionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CafeTableModelCopyWith<$Res>? get table {
    if (_self.table == null) {
    return null;
  }

  return $CafeTableModelCopyWith<$Res>(_self.table!, (value) {
    return _then(_self.copyWith(table: value));
  });
}/// Create a copy of TransactionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CustomerModelCopyWith<$Res>? get customer {
    if (_self.customer == null) {
    return null;
  }

  return $CustomerModelCopyWith<$Res>(_self.customer!, (value) {
    return _then(_self.copyWith(customer: value));
  });
}
}

// dart format on
