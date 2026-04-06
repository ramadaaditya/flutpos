import 'package:flutpos/features/products/data/datasources/product_local_datasource.dart';
import 'package:flutpos/features/products/data/repositories/product_repository_impl.dart';
import 'package:flutpos/features/products/domain/entities/product_entity.dart';
import 'package:flutpos/features/products/domain/repository/product_repository.dart';
import 'package:flutpos/features/products/domain/usecases/delete_product_usecase.dart';
import 'package:flutpos/features/products/domain/usecases/get_product_by_id_usecase.dart';
import 'package:flutpos/features/products/domain/usecases/get_products_usecase.dart';
import 'package:flutpos/features/products/domain/usecases/save_product_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productLocalDatasourceProvider = Provider<ProductLocalDatasource>((ref) {
  return ProductLocalDatasource();
});

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  return ProductRepositoryImpl(ref.read(productLocalDatasourceProvider));
});

final getProductsUseCaseProvider = Provider<GetProductsUseCase>((ref) {
  return GetProductsUseCase(ref.read(productRepositoryProvider));
});

final getProductByIdUseCaseProvider = Provider<GetProductByIdUseCase>((ref) {
  return GetProductByIdUseCase(ref.read(productRepositoryProvider));
});

final saveProductUseCaseProvider = Provider<SaveProductUseCase>((ref) {
  return SaveProductUseCase(ref.read(productRepositoryProvider));
});

final deleteProductUseCaseProvider = Provider<DeleteProductUseCase>((ref) {
  return DeleteProductUseCase(ref.read(productRepositoryProvider));
});

final productControllerProvider =
    NotifierProvider<ProductController, ProductState>(ProductController.new);

class ProductState {
  const ProductState({
    this.products = const <Product>[],
    this.isLoading = false,
    this.searchQuery = '',
    this.errorMessage,
  });

  final List<Product> products;
  final bool isLoading;
  final String searchQuery;
  final String? errorMessage;

  List<Product> get filteredProducts {
    if (searchQuery.trim().isEmpty) {
      return List<Product>.unmodifiable(products);
    }

    final String normalized = searchQuery.toLowerCase();
    return products
        .where(
          (Product product) =>
              product.name.toLowerCase().contains(normalized) ||
              product.categoryId.toLowerCase().contains(normalized) ||
              (product.description?.toLowerCase().contains(normalized) ??
                  false),
        )
        .toList(growable: false);
  }

  int get totalProducts => products.length;
  int get lowStockProducts =>
      products.where((Product product) => product.isLowStock).length;
  int get outOfStockProducts =>
      products.where((Product product) => product.isOutOfStock).length;

  double get inventoryValue {
    return products.fold<double>(
      0,
      (double total, Product product) =>
          total + (product.price * product.stock),
    );
  }

  ProductState copyWith({
    List<Product>? products,
    bool? isLoading,
    String? searchQuery,
    String? errorMessage,
    bool clearErrorMessage = false,
  }) {
    return ProductState(
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
      searchQuery: searchQuery ?? this.searchQuery,
      errorMessage: clearErrorMessage
          ? null
          : errorMessage ?? this.errorMessage,
    );
  }
}

class ProductController extends Notifier<ProductState> {
  late final GetProductsUseCase _getProductsUseCase;
  late final GetProductByIdUseCase _getProductByIdUseCase;
  late final SaveProductUseCase _saveProductUseCase;
  late final DeleteProductUseCase _deleteProductUseCase;

  @override
  ProductState build() {
    _getProductsUseCase = ref.read(getProductsUseCaseProvider);
    _getProductByIdUseCase = ref.read(getProductByIdUseCaseProvider);
    _saveProductUseCase = ref.read(saveProductUseCaseProvider);
    _deleteProductUseCase = ref.read(deleteProductUseCaseProvider);

    Future<void>.microtask(loadProducts);
    return const ProductState();
  }

  Future<void> loadProducts() async {
    state = state.copyWith(isLoading: true, clearErrorMessage: true);

    try {
      final List<Product> products = await _getProductsUseCase();
      state = state.copyWith(
        products: products,
        isLoading: false,
        clearErrorMessage: true,
      );
    } catch (error) {
      state = state.copyWith(isLoading: false, errorMessage: error.toString());
    }
  }

  Future<Product?> findProductById(String id) {
    return _getProductByIdUseCase(id);
  }

  Future<void> saveProduct(Product product) async {
    state = state.copyWith(isLoading: true, clearErrorMessage: true);

    try {
      final Product? existing = await _getProductByIdUseCase(product.id);
      if (existing == null) {
        await _saveProductUseCase.create(product);
      } else {
        await _saveProductUseCase.update(product);
      }
      final List<Product> products = await _getProductsUseCase();
      state = state.copyWith(
        products: products,
        isLoading: false,
        clearErrorMessage: true,
      );
    } catch (error) {
      state = state.copyWith(isLoading: false, errorMessage: error.toString());
      rethrow;
    }
  }

  Future<void> deleteProduct(String id) async {
    state = state.copyWith(isLoading: true, clearErrorMessage: true);

    try {
      await _deleteProductUseCase(id);
      final List<Product> products = await _getProductsUseCase();
      state = state.copyWith(
        products: products,
        isLoading: false,
        clearErrorMessage: true,
      );
    } catch (error) {
      state = state.copyWith(isLoading: false, errorMessage: error.toString());
      rethrow;
    }
  }

  void updateSearchQuery(String value) {
    state = state.copyWith(searchQuery: value);
  }
}
