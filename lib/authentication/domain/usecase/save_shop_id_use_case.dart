import 'package:app/authentication/domain/repositories/auth_repositroy.dart';

class SaveShopIdUseCase {
  final AuthRepository repository;

  SaveShopIdUseCase(this.repository);

  Future<void> call(String shopId) {
    return repository.saveShopId(shopId);
  }
}
