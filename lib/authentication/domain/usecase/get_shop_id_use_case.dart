import 'package:app/authentication/domain/repositories/auth_repositroy.dart';

class GetShopIdUseCase {
  final AuthRepository repository;

  GetShopIdUseCase(this.repository);

  Future<String?> call() {
    return repository.getShopId();
  }
}
