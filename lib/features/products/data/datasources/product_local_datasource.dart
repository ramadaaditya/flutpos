import 'package:flutpos/features/products/data/models/category_models.dart';
import 'package:flutpos/features/products/data/models/product_models.dart';
import 'package:flutpos/features/products/data/models/product_variant_models.dart';

class ProductLocalDatasource {
  ProductLocalDatasource() : _items = _seedData();

  final List<ProductModel> _items;

  Future<List<ProductModel>> getAllProducts() async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    return List<ProductModel>.unmodifiable(_items);
  }

  Future<ProductModel?> getProductById(String id) async {
    await Future<void>.delayed(const Duration(milliseconds: 120));
    for (final ProductModel product in _items) {
      if (product.id == id) {
        return product;
      }
    }
    return null;
  }

  Future<void> createProduct(ProductModel product) async {
    await Future<void>.delayed(const Duration(milliseconds: 120));
    _items.removeWhere((ProductModel item) => item.id == product.id);
    _items.insert(0, product);
  }

  Future<void> updateProduct(ProductModel product) async {
    await Future<void>.delayed(const Duration(milliseconds: 120));
    final int index = _items.indexWhere(
      (ProductModel item) => item.id == product.id,
    );
    if (index == -1) {
      throw StateError('Product with id ${product.id} was not found.');
    }
    _items[index] = product;
  }

  Future<void> deleteProduct(String id) async {
    await Future<void>.delayed(const Duration(milliseconds: 120));
    _items.removeWhere((ProductModel item) => item.id == id);
  }

  static List<ProductModel> _seedData() {
    final DateTime now = DateTime.now();

    return <ProductModel>[
      ProductModel(
        id: 'prd-001',
        name: 'Iced Latte',
        description: 'Espresso blend with cold milk and light foam.',
        imageUrl:
            'https://images.unsplash.com/photo-1509042239860-f550ce710b93',
        price: 28000,
        costPrice: 15000,
        stock: 24,
        minStock: 6,
        unit: 'pcs',
        categoryId: 'beverage',
        category: const CategoryModel(id: 'beverage', name: 'Beverage'),
        variants: const <ProductVariantModel>[],
        isAvailable: true,
        createdAt: now.subtract(const Duration(days: 8)),
        updatedAt: now.subtract(const Duration(days: 1)),
      ),
      ProductModel(
        id: 'prd-002',
        name: 'Chicken Rice Bowl',
        description: 'Rice bowl with chicken, vegetables, and house sauce.',
        imageUrl:
            'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4',
        price: 35000,
        costPrice: 20000,
        stock: 8,
        minStock: 5,
        unit: 'pcs',
        categoryId: 'food',
        category: const CategoryModel(id: 'food', name: 'Food'),
        variants: const <ProductVariantModel>[],
        isAvailable: true,
        createdAt: now.subtract(const Duration(days: 5)),
        updatedAt: now.subtract(const Duration(hours: 12)),
      ),
      ProductModel(
        id: 'prd-003',
        name: 'Vanilla Donut Box',
        description: 'Box of six soft donuts with vanilla glaze.',
        imageUrl: 'https://images.unsplash.com/photo-1551024601-bec78aea704b',
        price: 42000,
        costPrice: 25000,
        stock: 4,
        minStock: 6,
        unit: 'box',
        categoryId: 'snack',
        category: const CategoryModel(id: 'snack', name: 'Snack'),
        variants: const <ProductVariantModel>[],
        isAvailable: true,
        createdAt: now.subtract(const Duration(days: 10)),
        updatedAt: now.subtract(const Duration(days: 2)),
      ),
    ];
  }
}// class ProductLocalDatasource {
//   final List<ProductModel> _items = [];
// }
