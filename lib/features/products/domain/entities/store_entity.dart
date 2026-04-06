// store.dart
import 'package:equatable/equatable.dart';

class Store extends Equatable {
  final String id;
  final String name;
  final String? logoUrl;
  final String? address;
  final String? phone;
  final String? email;
  final String? taxNumber;
  final double defaultTaxPercent;
  final String currency;
  final String currencySymbol;
  final bool isPrintReceiptAuto;
  final String? receiptFooterNote;
  final int loyaltyPointRate;

  const Store({
    required this.id,
    required this.name,
    this.logoUrl,
    this.address,
    this.phone,
    this.email,
    this.taxNumber,
    required this.defaultTaxPercent,
    required this.currency,
    required this.currencySymbol,
    required this.isPrintReceiptAuto,
    this.receiptFooterNote,
    required this.loyaltyPointRate,
  });

  @override
  List<Object> get props => [id, name];
}
