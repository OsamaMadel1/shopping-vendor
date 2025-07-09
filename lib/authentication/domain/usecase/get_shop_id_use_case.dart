import 'package:app/authentication/domain/repositories/auth_repositroy.dart';

class GetshopeIdUseCase {
  final AuthRepository repository;

  GetshopeIdUseCase(this.repository);

  Future<String?> call() {
    return repository.getshopeId();
  }
}
