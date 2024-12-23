import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:quickchat_ui/config.dart';
import 'package:quickchat_ui/core/logic/cache_exeption.dart';
import 'package:quickchat_ui/core/logic/error_messages.dart';
import 'package:quickchat_ui/features/authentication/data/dto/LoginUser.dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDatasource {
  Future<Unit> saveCredentials(LoginUserDto loginData);
  Unit saveUser(String userId);
  Unit saveToken(String token);
  Future<LoginUserDto> getCredentials();
  Unit deleteCredetialsAndTokens();
}

@LazySingleton(as: AuthLocalDatasource)
class AuthLocalDatasourceImpl implements AuthLocalDatasource {
  AuthLocalDatasourceImpl({
    required this.flutterSecureStorage,
    required this.sharedPreferences,
  });

  final FlutterSecureStorage flutterSecureStorage;
  final SharedPreferences sharedPreferences;

  @override
  Unit saveToken(String token) {
    try {
      sharedPreferences.setString(CacheKeys.ACCESS_TOKEN, token);
      return unit;
    } catch (e) {
      throw CacheException(ERR_SAVE_TOKEN);
    }
  }

  @override
  Future<Unit> saveCredentials(LoginUserDto loginData) async {
    try {
      await flutterSecureStorage.write(
          key: CacheKeys.LOGGED_USERNAME, value: loginData.username);
      await flutterSecureStorage.write(
          key: CacheKeys.LOGGED_PASSWORD, value: loginData.password);
      return unit;
    } catch (e) {
      throw CacheException(ERR_SAVE_CREDENTIALS);
    }
  }

  @override
  Unit saveUser(String userId) {
    try {
      sharedPreferences.setString(CacheKeys.USER_ID, userId);
      return unit;
    } catch (e) {
      throw CacheException(ERR_SAVE_TOKEN);
    }
  }

  @override
  Future<LoginUserDto> getCredentials() async {
    try {
      final String? username =
          await flutterSecureStorage.read(key: CacheKeys.LOGGED_USERNAME);
      final String? password =
          await flutterSecureStorage.read(key: CacheKeys.LOGGED_PASSWORD);

      final LoginUserDto loginDatasDto =
          LoginUserDto(username: username ?? '', password: password ?? '');
      return loginDatasDto;
    } catch (e) {
      throw CacheException(ERR_GET_CREDENTIALS);
    }
  }

  @override
  Unit deleteCredetialsAndTokens() {
    try {
      flutterSecureStorage.delete(key: CacheKeys.LOGGED_USERNAME);
      flutterSecureStorage.delete(key: CacheKeys.LOGGED_PASSWORD);
      sharedPreferences.remove(CacheKeys.ACCESS_TOKEN);
      return unit;
    } catch (e) {
      throw CacheException(ERR_DEFAULT);
    }
  }
}
