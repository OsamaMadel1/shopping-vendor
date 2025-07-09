import 'package:app/authentication/data/source/local/auth_local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences prefs;

  AuthLocalDataSourceImpl(this.prefs);

  static const _tokenKey = 'auth_token';
  static const _shopeIdKey = 'shop_id';
  static const _userNameKey = 'user_name';

  @override
  Future<void> saveToken(String token) async {
    await prefs.setString(_tokenKey, token);
  }

  @override
  Future<String?> getToken() async {
    return prefs.getString(_tokenKey);
  }

  @override
  Future<void> saveshopeId(String shopeId) async {
    await prefs.setString(_shopeIdKey, shopeId);
  }

  @override
  Future<String?> getshopeId() async {
    return prefs.getString(_shopeIdKey);
  }

  @override
  Future<void> saveUserName(String userName) async {
    print("📥 saveUserName called with: $userName");
    await prefs.setString(_userNameKey, userName);
  }

  @override
  Future<String?> getUserName() async {
    return prefs.getString(_userNameKey);
  }

  Future<void> clearAll() async {
    await prefs.remove(_tokenKey);
    await prefs.remove(_shopeIdKey);
    await prefs.remove(_userNameKey);
  }

  @override
  Future<void> clearToken() async {
    await clearAll();
  }
}
