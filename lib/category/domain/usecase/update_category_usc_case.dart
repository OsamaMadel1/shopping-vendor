import 'package:app/category/domain/repositories/category_repository.dart';

class UpdateCategoryUscCase {
  final CategoryRepository repository;

  UpdateCategoryUscCase(this.repository);

  Future<String> call(String name) {
    return repository.updateCategory(name);
  }
}
