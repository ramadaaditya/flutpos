import 'package:flutpos/features/products/domain/entities/product_entity.dart';
import 'package:flutpos/features/products/domain/repository/product_repository.dart';

class SaveProductUseCase {
  SaveProductUseCase(this._repository);

  final ProductRepository _repository;

  Future<void> create(Product product) {
    return _repository.createProduct(product);
  }

  Future<void> update(Product product) {
    return _repository.updateProduct(product);
  }
}
