import 'package:app/authentication/domain/repositories/auth_repositroy.dart';

class SaveshopeIdUseCase {
  final AuthRepository repository;

  SaveshopeIdUseCase(this.repository);

  Future<void> call(String shopeId) {
    return repository.saveshopeId(shopeId);
  }
}
