import 'package:app/mangment_products/domain/entities/product_entity.dart';
import 'package:app/mangment_products/domain/repositories/product_repository.dart';

class UpdateProductUseCase {
  final ProductRepository productRepository;
  UpdateProductUseCase(this.productRepository);

  Future<void> call(ProductEntity product) async {
    await productRepository.updateProduct(product);
  }
}
