import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:quickchat_ui/core/auth/authentication_iterceptor.dart';
import 'package:quickchat_ui/dic/injection.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class DIContainer {
  @lazySingleton
  FlutterSecureStorage get flutterSecureStorage => const FlutterSecureStorage();

  // ignore: invalid_annotation_target
  @preResolve
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();

  @lazySingleton
  Dio get dio {
    final Dio dio = Dio();
    dio.interceptors.add(getIt<AuthenticationInterceptor>());
    return dio;
  }

  // @lazySingleton
  // http.Client get httpClient {
  //   final client = http.Client();
  //   return AuthenticatedClient(
  //       client: client,
  //       authInterceptor: getIt<HttpAuthenticationInterceptor>());
  // }

  @lazySingleton
  InternetConnectionChecker get internetConnectionChecker =>
      InternetConnectionChecker();
}
