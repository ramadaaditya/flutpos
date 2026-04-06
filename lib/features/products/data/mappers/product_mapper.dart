import 'package:flutpos/features/products/data/models/category_models.dart';
import 'package:flutpos/features/products/data/models/product_models.dart';
import 'package:flutpos/features/products/data/models/product_variant_models.dart';
import 'package:flutpos/features/products/domain/entities/product_entity.dart';

Product productFromModel(ProductModel model) {
  return Product(
    id: model.id,
    name: model.name,
    description: model.description,
    imageUrl: model.imageUrl,
    barcode: null,
    price: model.price,
    costPrice: model.costPrice,
    stock: model.stock,
    minStock: model.minStock,
    categoryId: model.categoryId ?? '',
    category: model.category == null
        ? null
        : categoryFromModel(model.category!),
    unit: productUnitFromString(model.unit),
    isActive: model.isAvailable,
    createdAt: model.createdAt ?? DateTime.now(),
    updatedAt: model.updatedAt ?? DateTime.now(),
  );
}

ProductModel productModelFromEntity(Product product) {
  return ProductModel(
    id: product.id,
    name: product.name,
    description: product.description,
    imageUrl: product.imageUrl,
    price: product.price,
    costPrice: product.costPrice,
    stock: product.stock,
    minStock: product.minStock,
    unit: product.unit.name,
    categoryId: product.categoryId.isEmpty ? null : product.categoryId,
    category: product.category == null
        ? null
        : categoryModelFromEntity(product.category!),
    variants: const <ProductVariantModel>[],
    isAvailable: product.isActive,
    createdAt: product.createdAt,
    updatedAt: product.updatedAt,
  );
}

CategoryEntity categoryFromModel(CategoryModel model) {
  return CategoryEntity(
    id: model.id,
    name: model.name,
    iconUrl: model.iconUrl,
    totalProductEntitys: 0,
  );
}

CategoryModel categoryModelFromEntity(CategoryEntity entity) {
  return CategoryModel(
    id: entity.id,
    name: entity.name,
    iconUrl: entity.iconUrl,
  );
}

ProductUnit productUnitFromString(String value) {
  return ProductUnit.values.firstWhere(
    (ProductUnit unit) => unit.name == value,
    orElse: () => ProductUnit.pcs,
  );
}
