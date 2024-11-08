import 'package:quickchat_ui/core/logic/result.dart';
import 'package:quickchat_ui/features/authentication/data/dto/SearchData.dto.dart';
import 'package:quickchat_ui/features/authentication/data/dto/SearchUser.dto.dart';
import 'package:quickchat_ui/features/authentication/data/dto/UserData.dto.dart';

abstract class UserRepository {
  Future<Result<UserDataDto>> getUser(String userId);
  Future<Result<SearchDataDto>> search(SearchUserDto searchUserDto);
}
