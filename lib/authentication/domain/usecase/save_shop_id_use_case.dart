import 'package:app/authentication/domain/repositories/auth_repositroy.dart';

class SaveshopIdUseCase {
  final AuthRepository repository;

  SaveshopIdUseCase(this.repository);

  Future<void> call(String shopId) {
    return repository.saveshopId(shopId);
  }
}
