import 'package:app/mangment_products/domain/entities/product_entity.dart';
import 'package:app/mangment_products/domain/repositories/product_repository.dart';

class FetchProductsUseCase {
  final ProductRepository productRepository;

  FetchProductsUseCase(this.productRepository);

  Future<List<ProductEntity>> call(
      {String? shopeId, String? categoryName}) async {
    return await productRepository.fetchProducts(
        shopeId: shopeId, categoryName: categoryName);
  }
}
