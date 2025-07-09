class LoginResponseEntity {
  final String token;
  final String shopeId;
  final String userName;

  const LoginResponseEntity({
    required this.token,
    required this.shopeId,
    required this.userName,
  });
}
