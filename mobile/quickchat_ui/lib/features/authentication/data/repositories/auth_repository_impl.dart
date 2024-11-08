import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:quickchat_ui/core/logic/error_messages.dart';
import 'package:quickchat_ui/core/logic/result.dart';
import 'package:quickchat_ui/core/logic/server_exeption.dart';
import 'package:quickchat_ui/core/network/network_info.dart';
import 'package:quickchat_ui/features/authentication/data/datasources/auth_local_datasource.dart';
import 'package:quickchat_ui/features/authentication/data/datasources/auth_remote_datasource.dart';
import 'package:quickchat_ui/features/authentication/data/dto/LoginData.dto.dart';
import 'package:quickchat_ui/features/authentication/data/dto/LoginUser.dto.dart';
import 'package:quickchat_ui/features/authentication/data/dto/RegisterUser.dto.dart';
import 'package:quickchat_ui/features/authentication/domain/repositories/auth_repository.dart';

@Environment(Environment.prod)
@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required this.networkInfo,
    required this.authRemoteDatasource,
    required this.authLocalDatasource,
  });

  final NetworkInfo networkInfo;
  final AuthRemoteDatasource authRemoteDatasource;
  final AuthLocalDatasource authLocalDatasource;

  @override
  Future<Result<Unit>> connectServer() async {
    if (await networkInfo.isConnected) {
      final Unit result = await authRemoteDatasource.connectServer();

      return Result<Unit>.ok(data: result);
    } else {
      return const Result<Unit>.fail(error: ERR_NO_INTERNET_CONNECTION);
    }
  }

  @override
  Future<Result<LoginDatasDto>> loginUser(LoginUserDto loginUserDto) async {
    if (await networkInfo.isConnected) {
      try {
        final LoginDatasDto loginResult =
            await authRemoteDatasource.loginUser(loginUserDto);

        authLocalDatasource.saveToken(loginResult.token);

        await authLocalDatasource.saveCredentials(loginUserDto);

        return Result<LoginDatasDto>.ok(data: loginResult);
      } on ServerException catch (e) {
        return Result<LoginDatasDto>.fail(error: e.message);
      }
    } else {
      return const Result<LoginDatasDto>.fail(
          error: ERR_NO_INTERNET_CONNECTION);
    }
  }

  @override
  Future<Result<LoginDatasDto>> autoLoginUser() async {
    if (await networkInfo.isConnected) {
      try {
        final LoginUserDto loginDatas =
            await authLocalDatasource.getCredentials();

        final LoginDatasDto loginResult =
            await authRemoteDatasource.loginUser(loginDatas);

        return Result<LoginDatasDto>.ok(data: loginResult);
      } on ServerException catch (e) {
        return Result<LoginDatasDto>.fail(error: e.message);
      }
    } else {
      return const Result<LoginDatasDto>.fail(
          error: ERR_NO_INTERNET_CONNECTION);
    }
  }

  @override
  Future<Result<Unit>> logoutUser() async {
    try {
      authLocalDatasource.deleteCredetialsAndTokens();
      return const Result<Unit>.ok(data: unit);
    } catch (e) {
      return const Result<Unit>.fail(error: ERR_DEFAULT);
    }
  }

  @override
  Future<Result<Unit>> registerUser(RegisterUserDto registerUserDto) async {
    if (await networkInfo.isConnected) {
      try {
        final Unit loginResult =
            await authRemoteDatasource.registerUser(registerUserDto);

        final LoginUserDto registerLoginData = LoginUserDto(
          username: registerUserDto.username,
          password: registerUserDto.password,
        );

        await authLocalDatasource.saveCredentials(registerLoginData);

        return Result<Unit>.ok(data: loginResult);
      } on ServerException catch (e) {
        return Result<Unit>.fail(error: e.message);
      }
    } else {
      return const Result<Unit>.fail(error: ERR_NO_INTERNET_CONNECTION);
    }
  }

  @override
  Future<Result<LoginUserDto>> getCredentials() async {
    if (await networkInfo.isConnected) {
      try {
        final LoginUserDto loginData =
            await authLocalDatasource.getCredentials();

        return Result<LoginUserDto>.ok(data: loginData);
      } on ServerException catch (e) {
        return Result<LoginUserDto>.fail(error: e.message);
      }
    } else {
      return const Result<LoginUserDto>.fail(error: ERR_NO_INTERNET_CONNECTION);
    }
  }
}
