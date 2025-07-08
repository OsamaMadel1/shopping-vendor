import 'package:app/authentication/data/models/login_response_model.dart';
import 'package:app/authentication/data/models/user_login_model.dart';
import 'package:app/authentication/data/models/user_register_model.dart';

abstract class AuthRemoteDataSource {
  Future<String> register(UserRegisterModel user);
  Future<LoginResponseModel> login(UserLoginModel user);
}
