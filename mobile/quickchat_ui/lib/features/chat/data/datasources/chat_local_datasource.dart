import 'package:injectable/injectable.dart';
import 'package:quickchat_ui/config.dart';
import 'package:quickchat_ui/core/logic/cache_exeption.dart';
import 'package:quickchat_ui/core/logic/error_messages.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ChatLocalDatasource {
  String getToken();
}

@LazySingleton(as: ChatLocalDatasource)
class ChatLocalDatasourceImpl implements ChatLocalDatasource {
  ChatLocalDatasourceImpl({
    required this.sharedPreferences,
  });

  final SharedPreferences sharedPreferences;

  @override
  String getToken() {
    try {
      final String? result =
          sharedPreferences.getString(CacheKeys.ACCESS_TOKEN);
      if (result == null || result.isEmpty) {
        throw CacheException(ERR_TOKEN_NOT_FOUND);
      }

      return result;
    } catch (e) {
      throw CacheException(ERR_GET_TOKEN);
    }
  }
}
