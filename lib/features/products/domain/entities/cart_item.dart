// cart_item.dart
import 'package:equatable/equatable.dart';
import 'package:flutpos/features/products/domain/entities/customer_entity.dart';
import 'package:flutpos/features/products/domain/entities/product_entity.dart';

class CartItem extends Equatable {
  final String id;
  final Product product;
  final int quantity;
  final double unitPrice; // Bisa beda dari product.price jika ada override
  final double? discountAmount; // Diskon per item
  final String? note;

  const CartItem({
    required this.id,
    required this.product,
    required this.quantity,
    required this.unitPrice,
    this.discountAmount,
    this.note,
  });

  double get subtotal => (unitPrice * quantity) - (discountAmount ?? 0);

  CartItem copyWith({
    int? quantity,
    double? unitPrice,
    double? discountAmount,
    String? note,
  }) {
    return CartItem(
      id: id,
      product: product,
      quantity: quantity ?? this.quantity,
      unitPrice: unitPrice ?? this.unitPrice,
      discountAmount: discountAmount ?? this.discountAmount,
      note: note ?? this.note,
    );
  }

  @override
  List<Object> get props => [id, product.id, quantity];
}

// cart.dart
class Cart extends Equatable {
  final List<CartItem> items;
  final Customer? customer;
  final double discountAmount; // Diskon keseluruhan (nominal)
  final double discountPercent; // Diskon keseluruhan (%)
  final double taxPercent; // PPN (misal 11%)
  final String? note;

  const Cart({
    required this.items,
    this.customer,
    this.discountAmount = 0,
    this.discountPercent = 0,
    this.taxPercent = 0,
    this.note,
  });

  int get totalItems => items.fold(0, (sum, item) => sum + item.quantity);

  double get subtotal => items.fold(0, (sum, item) => sum + item.subtotal);

  double get discountTotal {
    final percentDiscount = subtotal * (discountPercent / 100);
    return percentDiscount + discountAmount;
  }

  double get taxAmount => (subtotal - discountTotal) * (taxPercent / 100);

  double get grandTotal => subtotal - discountTotal + taxAmount;

  bool get isEmpty => items.isEmpty;

  Cart copyWith({
    List<CartItem>? items,
    Customer? customer,
    double? discountAmount,
    double? discountPercent,
    double? taxPercent,
    String? note,
  }) {
    return Cart(
      items: items ?? this.items,
      customer: customer ?? this.customer,
      discountAmount: discountAmount ?? this.discountAmount,
      discountPercent: discountPercent ?? this.discountPercent,
      taxPercent: taxPercent ?? this.taxPercent,
      note: note ?? this.note,
    );
  }

  @override
  List<Object> get props => [items, grandTotal];
}
