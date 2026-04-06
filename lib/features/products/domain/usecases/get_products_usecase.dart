import 'package:flutpos/features/products/domain/entities/product_entity.dart';
import 'package:flutpos/features/products/domain/repository/product_repository.dart';

class GetProductsUseCase {
  GetProductsUseCase(this._repository);

  final ProductRepository _repository;

  Future<List<Product>> call() {
    return _repository.getAllProducts();
  }
}
