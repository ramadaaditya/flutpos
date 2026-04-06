// lib/features/transaction/data/models/transaction_item_model.dart
import 'package:flutpos/features/products/data/models/customer_models.dart';
import 'package:flutpos/features/products/data/models/table_models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_item_models.freezed.dart';
part 'transaction_item_models.g.dart';

@freezed
abstract class TransactionItemModel with _$TransactionItemModel {
  const factory TransactionItemModel({
    String? id,
    @JsonKey(name: 'transaction_id') String? transactionId,
    @JsonKey(name: 'product_id') required String productId,
    @JsonKey(name: 'product_name') required String productName,
    @JsonKey(name: 'unit_price') required double unitPrice,
    required int quantity,
    Map<String, dynamic>? variants, // {"Ukuran": "Large", "Suhu": "Ice"}
    @JsonKey(name: 'discount_amount') @Default(0) double discountAmount,
    required double subtotal,
    String? note,
  }) = _TransactionItemModel;

  factory TransactionItemModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionItemModelFromJson(json);
}

// lib/features/transaction/data/models/transaction_model.dart
@freezed
abstract class TransactionModel with _$TransactionModel {
  const factory TransactionModel({
    String? id,
    @JsonKey(name: 'invoice_number') String? invoiceNumber,
    @JsonKey(name: 'table_id') String? tableId,
    @JsonKey(name: 'customer_id') String? customerId,
    @JsonKey(name: 'cashier_id') String? cashierId,
    @JsonKey(name: 'order_type') required OrderType orderType,
    required double subtotal,
    @JsonKey(name: 'discount_amount') @Default(0) double discountAmount,
    @JsonKey(name: 'tax_amount') @Default(0) double taxAmount,
    @JsonKey(name: 'grand_total') required double grandTotal,
    @JsonKey(name: 'payment_method') PaymentMethod? paymentMethod,
    @JsonKey(name: 'total_paid') double? totalPaid,
    @JsonKey(name: 'change_amount') @Default(0) double changeAmount,
    @Default(TransactionStatus.pending) TransactionStatus status,
    String? note,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    // Joined
    @JsonKey(name: 'transaction_items')
    @Default([])
    List<TransactionItemModel> items,
    @JsonKey(name: 'cafe_tables') CafeTableModel? table,
    @JsonKey(name: 'customers') CustomerModel? customer,
  }) = _TransactionModel;

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);
}

enum OrderType {
  @JsonValue('dine_in')
  dineIn,
  @JsonValue('takeaway')
  takeaway,
}

enum TransactionStatus {
  @JsonValue('pending')
  pending,
  @JsonValue('in_progress')
  inProgress,
  @JsonValue('completed')
  completed,
  @JsonValue('cancelled')
  cancelled,
}

enum PaymentMethod {
  @JsonValue('cash')
  cash,
  @JsonValue('qris')
  qris,
  @JsonValue('transfer')
  transfer,
}
