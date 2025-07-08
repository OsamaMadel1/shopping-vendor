import 'package:app/category/domain/entity/gategory_entity.dart';
import 'package:app/category/domain/repositories/category_repository.dart';

class GetAllCategoriesUseCase {
  final CategoryRepository repository;

  GetAllCategoriesUseCase(this.repository);

  Future<List<CategoryEntity>> call() {
    return repository.getAllCategories();
  }
}
