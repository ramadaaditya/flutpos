// daily_report.dart
import 'package:equatable/equatable.dart';
import 'package:flutpos/features/products/domain/entities/payment_entity.dart';

class DailyReport extends Equatable {
  final DateTime date;
  final int totalTransaction;
  final int totalItemSold;
  final double totalRevenue;
  final double totalDiscount;
  final double totalTax;
  final double netRevenue;
  final double totalProfit; // Jika costPrice diisi
  final Map<PaymentMethod, double> revenueByPayment;
  final List<ProductSaleSummary> topProducts;

  const DailyReport({
    required this.date,
    required this.totalTransaction,
    required this.totalItemSold,
    required this.totalRevenue,
    required this.totalDiscount,
    required this.totalTax,
    required this.netRevenue,
    required this.totalProfit,
    required this.revenueByPayment,
    required this.topProducts,
  });

  @override
  List<Object> get props => [date, totalRevenue];
}

// product_sale_summary.dart
class ProductSaleSummary extends Equatable {
  final String productId;
  final String productName;
  final int totalQuantity;
  final double totalRevenue;
  final double totalProfit;

  const ProductSaleSummary({
    required this.productId,
    required this.productName,
    required this.totalQuantity,
    required this.totalRevenue,
    required this.totalProfit,
  });

  @override
  List<Object> get props => [productId, totalQuantity];
}
