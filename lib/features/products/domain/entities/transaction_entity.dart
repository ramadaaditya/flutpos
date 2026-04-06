// transaction.dart
import 'package:equatable/equatable.dart';
import 'package:flutpos/features/products/domain/entities/customer_entity.dart';
import 'package:flutpos/features/products/domain/entities/payment_entity.dart';
import 'package:flutpos/features/products/domain/entities/user_entity.dart';

class Transaction extends Equatable {
  final String id;
  final String invoiceNumber; // INV-20241201-001
  final List<TransactionItem> items;
  final Customer? customer;
  final String cashierId;
  final User? cashier;
  final double subtotal;
  final double discountAmount;
  final double taxAmount;
  final double grandTotal;
  final List<Payment> payments; // Support split payment
  final double totalPaid;
  final double change; // Kembalian
  final TransactionStatus status;
  final String? note;
  final DateTime transactionDate;

  const Transaction({
    required this.id,
    required this.invoiceNumber,
    required this.items,
    this.customer,
    required this.cashierId,
    this.cashier,
    required this.subtotal,
    required this.discountAmount,
    required this.taxAmount,
    required this.grandTotal,
    required this.payments,
    required this.totalPaid,
    required this.change,
    required this.status,
    this.note,
    required this.transactionDate,
  });

  int get totalItems => items.fold(0, (sum, item) => sum + item.quantity);

  @override
  List<Object> get props => [id, invoiceNumber];
}

// transaction_item.dart — snapshot produk saat transaksi
class TransactionItem extends Equatable {
  final String id;
  final String transactionId;
  final String productId;
  final String productName; // Snapshot nama produk
  final double unitPrice; // Snapshot harga saat itu
  final int quantity;
  final double discountAmount;
  final double subtotal;

  const TransactionItem({
    required this.id,
    required this.transactionId,
    required this.productId,
    required this.productName,
    required this.unitPrice,
    required this.quantity,
    required this.discountAmount,
    required this.subtotal,
  });

  @override
  List<Object> get props => [id, productId];
}

enum TransactionStatus { completed, pending, cancelled, refunded }
