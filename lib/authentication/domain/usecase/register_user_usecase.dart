import 'package:app/authentication/domain/entities/user_register_entity.dart';
import 'package:app/authentication/domain/repositories/auth_repositroy.dart';

class RegisterUserUseCase {
  final AuthRepository repository;

  RegisterUserUseCase(this.repository);

  Future<String> call(UserRegisterEntity user) {
    return repository.registerUser(user);
  }
}
