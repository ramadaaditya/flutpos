// payment.dart
import 'package:equatable/equatable.dart';

class Payment extends Equatable {
  final String id;
  final PaymentMethod method;
  final double amount;
  final String? referenceNumber; // Nomor referensi transfer/QRIS
  final DateTime paidAt;

  const Payment({
    required this.id,
    required this.method,
    required this.amount,
    this.referenceNumber,
    required this.paidAt,
  });

  @override
  List<Object> get props => [id, method, amount];
}

enum PaymentMethod { cash, qris, bankTransfer, creditCard, debitCard, ewallet }

// Extension untuk label & icon
extension PaymentMethodExt on PaymentMethod {
  String get label {
    switch (this) {
      case PaymentMethod.cash:
        return 'Tunai';
      case PaymentMethod.qris:
        return 'QRIS';
      case PaymentMethod.bankTransfer:
        return 'Transfer Bank';
      case PaymentMethod.creditCard:
        return 'Kartu Kredit';
      case PaymentMethod.debitCard:
        return 'Kartu Debit';
      case PaymentMethod.ewallet:
        return 'E-Wallet';
    }
  }

  String get iconAsset {
    switch (this) {
      case PaymentMethod.cash:
        return 'assets/icons/cash.svg';
      case PaymentMethod.qris:
        return 'assets/icons/qris.svg';
      default:
        return 'assets/icons/card.svg';
    }
  }
}
