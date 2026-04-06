// customer.dart
import 'package:equatable/equatable.dart';

class Customer extends Equatable {
  final String id;
  final String name;
  final String? phone;
  final String? email;
  final String? address;
  final int loyaltyPoints;
  final double totalSpending;
  final int totalTransaction;
  final DateTime? lastTransactionAt;
  final DateTime createdAt;

  const Customer({
    required this.id,
    required this.name,
    this.phone,
    this.email,
    this.address,
    required this.loyaltyPoints,
    required this.totalSpending,
    required this.totalTransaction,
    this.lastTransactionAt,
    required this.createdAt,
  });

  // Customer tier berdasarkan spending
  CustomerTier get tier {
    if (totalSpending >= 5000000) return CustomerTier.platinum;
    if (totalSpending >= 2000000) return CustomerTier.gold;
    if (totalSpending >= 500000) return CustomerTier.silver;
    return CustomerTier.bronze;
  }

  @override
  List<Object> get props => [id, phone ?? name];
}

enum CustomerTier { bronze, silver, gold, platinum }
