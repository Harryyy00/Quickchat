import 'package:dartz/dartz.dart';
import 'package:quickchat_ui/core/logic/result.dart';
import 'package:quickchat_ui/features/authentication/data/dto/LoginData.dto.dart';
import 'package:quickchat_ui/features/authentication/data/dto/LoginUser.dto.dart';
import 'package:quickchat_ui/features/authentication/data/dto/RegisterUser.dto.dart';

abstract class AuthRepository {
  Future<Result<Unit>> connectServer();
  Future<Result<LoginUserDto>> getCredentials();
  Future<Result<Unit>> registerUser(
    RegisterUserDto registerUserDto,
  );
  Future<Result<LoginDatasDto>> loginUser(
    LoginUserDto loginUserDto,
  );
  Future<Result<LoginDatasDto>> autoLoginUser();
  Future<Result<Unit>> logoutUser();
}
