import 'package:app/mangment_products/domain/repositories/product_repository.dart';

class DeleteProductUseCase {
  final ProductRepository productRepository;
  DeleteProductUseCase(this.productRepository);

  Future<void> call(String id) async {
    await productRepository.deleteProduct(id);
  }
}
