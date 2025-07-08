import 'package:app/authentication/domain/repositories/auth_repositroy.dart';

class ClearTokenUseCase {
  final AuthRepository repository;

  ClearTokenUseCase(this.repository);

  Future<void> call() {
    return repository.clearToken();
  }
}
