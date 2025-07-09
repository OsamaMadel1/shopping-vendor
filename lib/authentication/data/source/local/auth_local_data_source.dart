abstract class AuthLocalDataSource {
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> clearToken();
  Future<void> saveshopeId(String shopeId);
  Future<String?> getshopeId();
  Future<void> saveUserName(String userName);
  Future<String?> getUserName();
}
