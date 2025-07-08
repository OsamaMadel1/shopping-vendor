import 'package:app/authentication/domain/repositories/auth_repositroy.dart';

class GetUserNameUseCase {
  final AuthRepository repository;

  GetUserNameUseCase(this.repository);

  Future<String?> call() {
    return repository.getUserName();
  }
}
