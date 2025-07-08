import 'package:app/authentication/domain/repositories/auth_repositroy.dart';

class SaveUserNameUseCase {
  final AuthRepository repository;

  SaveUserNameUseCase(this.repository);

  Future<void> call(String userName) {
    return repository.saveUserName(userName);
  }
}
