import 'package:injectable/injectable.dart';
import 'package:quickchat_ui/core/logic/error_messages.dart';
import 'package:quickchat_ui/core/logic/result.dart';
import 'package:quickchat_ui/core/logic/server_exeption.dart';
import 'package:quickchat_ui/core/network/network_info.dart';
import 'package:quickchat_ui/features/authentication/data/dto/SearchData.dto.dart';
import 'package:quickchat_ui/features/authentication/data/dto/SearchUser.dto.dart';
import 'package:quickchat_ui/features/authentication/data/dto/UserData.dto.dart';
import 'package:quickchat_ui/features/user/data/datasources/user_local_datasource.dart';
import 'package:quickchat_ui/features/user/data/datasources/user_remote_datasource.dart';
import 'package:quickchat_ui/features/user/domain/repositories/user_repository.dart';

@Environment(Environment.prod)
@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl({
    required this.networkInfo,
    required this.userRemoteDatasource,
    required this.userLocalDatasource,
  });
  final NetworkInfo networkInfo;
  final UserRemoteDatasource userRemoteDatasource;
  final UserLocalDatasource userLocalDatasource;

  @override
  Future<Result<UserDataDto>> getUser(String userId) async {
    if (await networkInfo.isConnected) {
      try {
        final UserDataDto loginResult =
            await userRemoteDatasource.getUser(userId);

        return Result<UserDataDto>.ok(data: loginResult);
      } on ServerException catch (e) {
        return Result<UserDataDto>.fail(error: e.message);
      }
    } else {
      return const Result<UserDataDto>.fail(error: ERR_NO_INTERNET_CONNECTION);
    }
  }

  @override
  Future<Result<SearchDataDto>> search(SearchUserDto searchUserDto) async {
    if (await networkInfo.isConnected) {
      try {
        final SearchDataDto loginResult =
            await userRemoteDatasource.search(searchUserDto);

        return Result<SearchDataDto>.ok(data: loginResult);
      } on ServerException catch (e) {
        return Result<SearchDataDto>.fail(error: e.message);
      }
    } else {
      return const Result<SearchDataDto>.fail(
          error: ERR_NO_INTERNET_CONNECTION);
    }
  }
}
