import 'package:app/category/domain/repositories/category_repository.dart';

class DeleteCategoryUscCase {
  final CategoryRepository repository;

  DeleteCategoryUscCase(this.repository);

  Future<void> call(String name) {
    return repository.deleteCategory(name);
  }
}
