abstract class AuthLocalDataSource {
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> clearToken();
  Future<void> saveShopId(String shopId);
  Future<String?> getShopId();
  Future<void> saveUserName(String userName);
  Future<String?> getUserName();
}
