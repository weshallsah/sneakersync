import 'dart:convert';

import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:bazar/models/user.model.dart';

class AuthService {
  static Future<bool> islogin() async {
    return await APICacheManager().isAPICacheKeyExist("Login");
    
  }

  static Future<void> deleteuser() async {
    await APICacheManager().deleteCache("Login");
  }

  static Future<UserModel?> getuser() async {
    final user = await APICacheManager().getCacheData("Login");
    if (user.key.isNotEmpty) {
      final cachedata = await APICacheManager().getCacheData("Login");
      return UserModel.fromJson(jsonDecode(cachedata.syncData));
    }
  }

  static Future<void> setlogin(UserModel userModel) async {
    APICacheDBModel cacheDBModel = APICacheDBModel(
      key: "Login",
      syncData: jsonEncode(
        userModel.toJson(),
      ),
    );
    await APICacheManager().addCacheData(cacheDBModel);
  }
}
