import 'dart:convert';
import 'dart:isolate';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:quickchat_ui/config.dart';
import 'package:quickchat_ui/core/logic/server_exeption.dart';
import 'package:quickchat_ui/features/authentication/data/dto/LoginData.dto.dart';
import 'package:quickchat_ui/features/authentication/data/dto/LoginUser.dto.dart';
import 'package:quickchat_ui/features/authentication/data/dto/RegisterUser.dto.dart';

abstract class AuthRemoteDatasource {
  Future<Unit> connectServer();
  Future<LoginDatasDto> loginUser(LoginUserDto loginUserDto);
  Future<Unit> registerUser(RegisterUserDto registerUserDto);
}

@LazySingleton(as: AuthRemoteDatasource)
class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  AuthRemoteDatasourceImpl({
    required this.dio,
    required this.config,
  });

  final Dio dio;
  final Config config;

  @override
  Future<Unit> connectServer() async {
    late Response<dynamic> response;

    try {
      response = await dio.head('${config.quickChatService}/test');
    } catch (e) {
      throw checkErrResponse(response);
    }

    if (response.statusCode == 200) {
      return unit;
    } else {
      throw checkErrResponse(response);
    }
  }

  @override
  Future<LoginDatasDto> loginUser(LoginUserDto loginUserDto) async {
    late Response<dynamic> response;
    late LoginDatasDto resultData;

    try {
      final Map<String, dynamic> rawData = <String, dynamic>{
        'userName': loginUserDto.username,
        'password': loginUserDto.password,
      };

      // Send the login request
      response = await dio.post(
        '${config.quickChatService}/login',
        data: jsonEncode(rawData),
      );

      // Use Isolate.run for heavy computation (in this case, parsing the response)
      resultData = await Isolate.run(() {
        final Map<String, dynamic> result = response.data['data'];
        return LoginDatasDto.fromJson(result);
      });
    } on DioException catch (e) {
      throw checkErrResponse(e.response);
    } catch (e) {
      throw checkErrResponse(response);
    }

    if (response.statusCode == 200) {
      return resultData;
    } else {
      throw checkErrResponse(response);
    }
  }

  @override
  Future<Unit> registerUser(RegisterUserDto registerUserDto) async {
    late Response<dynamic> response;

    try {
      final Map<String, dynamic> rawData = <String, dynamic>{
        'name': registerUserDto.name,
        'userName': registerUserDto.username,
        'password': registerUserDto.password,
        'password_confirmation': registerUserDto.password,
      };

      // Send the login request
      response = await dio.post(
        '${config.quickChatService}/register',
        data: jsonEncode(rawData),
      );
    } on DioException catch (e) {
      throw checkErrResponse(e.response);
    } catch (e) {
      throw checkErrResponse(response);
    }

    if (response.statusCode == 201) {
      return unit;
    } else {
      throw checkErrResponse(response);
    }
  }
}
