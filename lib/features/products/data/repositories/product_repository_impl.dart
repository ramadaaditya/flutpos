import 'package:flutpos/features/products/data/datasources/product_local_datasource.dart';
import 'package:flutpos/features/products/data/mappers/product_mapper.dart';
import 'package:flutpos/features/products/domain/entities/product_entity.dart';
import 'package:flutpos/features/products/domain/repository/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  ProductRepositoryImpl(this._datasource);

  final ProductLocalDatasource _datasource;

  @override
  Future<List<Product>> getAllProducts() async {
    final products = await _datasource.getAllProducts();
    return products.map(productFromModel).toList(growable: false);
  }

  @override
  Future<Product?> getProductById(String id) async {
    final product = await _datasource.getProductById(id);
    return product == null ? null : productFromModel(product);
  }

  @override
  Future<void> createProduct(Product product) async {
    await _datasource.createProduct(productModelFromEntity(product));
  }

  @override
  Future<void> updateProduct(Product product) async {
    await _datasource.updateProduct(productModelFromEntity(product));
  }

  @override
  Future<void> delete(String id) async {
    await _datasource.deleteProduct(id);
  }
}
