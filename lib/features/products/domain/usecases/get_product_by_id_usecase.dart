import 'package:flutpos/features/products/domain/entities/product_entity.dart';
import 'package:flutpos/features/products/domain/repository/product_repository.dart';

class GetProductByIdUseCase {
  GetProductByIdUseCase(this._repository);

  final ProductRepository _repository;

  Future<Product?> call(String id) {
    return _repository.getProductById(id);
  }
}
