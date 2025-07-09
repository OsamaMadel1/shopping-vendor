import 'package:app/authentication/domain/entities/login_response_entity.dart';

class LoginResponseModel {
  final String token;
  final String shopeId;
  final String userName;

  LoginResponseModel({
    required this.token,
    required this.shopeId,
    required this.userName,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    print("🧪 FULL RESPONSE: $data");
    return LoginResponseModel(
      token: data['token'],
      shopeId: data['shopeId'],
      userName: data['userName'],
    );
  }

  LoginResponseEntity toEntity() {
    return LoginResponseEntity(
      token: token,
      shopeId: shopeId,
      userName: userName,
    );
  }
}
