// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_item_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransactionItemModel _$TransactionItemModelFromJson(
  Map<String, dynamic> json,
) => _TransactionItemModel(
  id: json['id'] as String?,
  transactionId: json['transaction_id'] as String?,
  productId: json['product_id'] as String,
  productName: json['product_name'] as String,
  unitPrice: (json['unit_price'] as num).toDouble(),
  quantity: (json['quantity'] as num).toInt(),
  variants: json['variants'] as Map<String, dynamic>?,
  discountAmount: (json['discount_amount'] as num?)?.toDouble() ?? 0,
  subtotal: (json['subtotal'] as num).toDouble(),
  note: json['note'] as String?,
);

Map<String, dynamic> _$TransactionItemModelToJson(
  _TransactionItemModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'transaction_id': instance.transactionId,
  'product_id': instance.productId,
  'product_name': instance.productName,
  'unit_price': instance.unitPrice,
  'quantity': instance.quantity,
  'variants': instance.variants,
  'discount_amount': instance.discountAmount,
  'subtotal': instance.subtotal,
  'note': instance.note,
};

_TransactionModel _$TransactionModelFromJson(
  Map<String, dynamic> json,
) => _TransactionModel(
  id: json['id'] as String?,
  invoiceNumber: json['invoice_number'] as String?,
  tableId: json['table_id'] as String?,
  customerId: json['customer_id'] as String?,
  cashierId: json['cashier_id'] as String?,
  orderType: $enumDecode(_$OrderTypeEnumMap, json['order_type']),
  subtotal: (json['subtotal'] as num).toDouble(),
  discountAmount: (json['discount_amount'] as num?)?.toDouble() ?? 0,
  taxAmount: (json['tax_amount'] as num?)?.toDouble() ?? 0,
  grandTotal: (json['grand_total'] as num).toDouble(),
  paymentMethod: $enumDecodeNullable(
    _$PaymentMethodEnumMap,
    json['payment_method'],
  ),
  totalPaid: (json['total_paid'] as num?)?.toDouble(),
  changeAmount: (json['change_amount'] as num?)?.toDouble() ?? 0,
  status:
      $enumDecodeNullable(_$TransactionStatusEnumMap, json['status']) ??
      TransactionStatus.pending,
  note: json['note'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  items:
      (json['transaction_items'] as List<dynamic>?)
          ?.map((e) => TransactionItemModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  table: json['cafe_tables'] == null
      ? null
      : CafeTableModel.fromJson(json['cafe_tables'] as Map<String, dynamic>),
  customer: json['customers'] == null
      ? null
      : CustomerModel.fromJson(json['customers'] as Map<String, dynamic>),
);

Map<String, dynamic> _$TransactionModelToJson(_TransactionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'invoice_number': instance.invoiceNumber,
      'table_id': instance.tableId,
      'customer_id': instance.customerId,
      'cashier_id': instance.cashierId,
      'order_type': _$OrderTypeEnumMap[instance.orderType]!,
      'subtotal': instance.subtotal,
      'discount_amount': instance.discountAmount,
      'tax_amount': instance.taxAmount,
      'grand_total': instance.grandTotal,
      'payment_method': _$PaymentMethodEnumMap[instance.paymentMethod],
      'total_paid': instance.totalPaid,
      'change_amount': instance.changeAmount,
      'status': _$TransactionStatusEnumMap[instance.status]!,
      'note': instance.note,
      'created_at': instance.createdAt?.toIso8601String(),
      'transaction_items': instance.items,
      'cafe_tables': instance.table,
      'customers': instance.customer,
    };

const _$OrderTypeEnumMap = {
  OrderType.dineIn: 'dine_in',
  OrderType.takeaway: 'takeaway',
};

const _$PaymentMethodEnumMap = {
  PaymentMethod.cash: 'cash',
  PaymentMethod.qris: 'qris',
  PaymentMethod.transfer: 'transfer',
};

const _$TransactionStatusEnumMap = {
  TransactionStatus.pending: 'pending',
  TransactionStatus.inProgress: 'in_progress',
  TransactionStatus.completed: 'completed',
  TransactionStatus.cancelled: 'cancelled',
};
