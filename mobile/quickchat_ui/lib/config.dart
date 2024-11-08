// ignore_for_file: constant_identifier_names

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SystemFontScale {
  static const String SYSTEMFONTSCALE_SMALL = 'Small';
  static const String SYSTEMFONTSCALE_DEFAULT = 'Default';
  static const String SYSTEMFONTSCALE_LARGE = 'Large';
  static const String SYSTEMFONTSCALE_LARGEST = 'Largest';
}

class CacheKeys {
  /// auth keys
  ///

  static const String LOGGED_USERNAME = 'username';
  static const String LOGGED_PASSWORD = 'password';
  static const String ACCESS_TOKEN = 'access_token';
  static const String REFRESH_TOKEN = 'refresh_token';
  static const String USER_ID = 'user_id';
}

class ScreenRoute {
  /// Root Paths
  /// Root paths should start with a "/"
  ///
  static const String INITIAL_ROUTE = '/';
  static const String LOGIN_ROUTE = '/LoginPage';
  static const String REGISTER_ROUTE = '/RegisterPage';
  static const String HOME_ROUTE = '/HomePage';
  static const String CHAT_ROUTE = '/ChatPage';
  static const String USER_DETAILS_ROUTE = '/UserDetailsPage';

  /// Nested
  /// Sub root paths should not start with a "/"
  static const String CHATS_ROUTE = 'ChatsPage';
  static const String CONTACTS_ROUTE = 'ContactsPage';
  static const String MENU_ROUTE = 'MenuPage';
}

abstract class Config {
  String get quickChatService;
  String get quickChatSSEService;
}

@LazySingleton(as: Config)
class ConfigImpl implements Config {
  ConfigImpl(this.prefs);
  final SharedPreferences prefs;

  /// Dev Environment
  ///
  // @override
  // String get quickChatService => 'TBD'

  /// Local Environment
  ///
  // @override
  // String get quickChatService =>
  //     'http://192.168.254.108:8000/api'; //php artisan serve --host=0.0.0.0 --port=8000

  // @override
  // String get quickChatSSEService => 'http://192.168.254.108:3000';

  // harry

  @override
  String get quickChatService =>
      'http://192.168.254.198:8000/api'; //php artisan serve --host=0.0.0.0 --port=8000

  @override
  String get quickChatSSEService => 'http://192.168.254.198:3000';
}
