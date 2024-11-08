import 'dart:convert';
import 'dart:isolate';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:quickchat_ui/config.dart';
import 'package:quickchat_ui/core/logic/server_exeption.dart';
import 'package:quickchat_ui/features/authentication/data/dto/SearchData.dto.dart';
import 'package:quickchat_ui/features/authentication/data/dto/SearchUser.dto.dart';
import 'package:quickchat_ui/features/authentication/data/dto/UserData.dto.dart';

abstract class UserRemoteDatasource {
  Future<UserDataDto> getUser(String userId);
  Future<SearchDataDto> search(SearchUserDto searchUserDto);
}

@LazySingleton(as: UserRemoteDatasource)
class PostsRemoteDatasourceImpl implements UserRemoteDatasource {
  PostsRemoteDatasourceImpl({
    required this.dio,
    required this.config,
  });

  final Dio dio;
  final Config config;

  @override
  Future<UserDataDto> getUser(String userId) async {
    late Response<dynamic> response;
    late UserDataDto resultData;

    try {
      final Map<String, dynamic> rawData = <String, dynamic>{
        'userId': userId,
      };

      // Fetch user data
      response = await dio.get(
        '${config.quickChatService}/getUser',
        data: jsonEncode(rawData),
      );

      // final Map<String, dynamic> reee = jsonDecode(response.data);

      // print('jawa ${response.data}');
      // print('jaws ${response.data['data']}');
      // print('heheh ${UserDataDto.fromJson(reee)}');

      resultData = await Isolate.run(() {
        final Map<String, dynamic> result = response.data['data'];

        return UserDataDto.fromJson(result);
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
  Future<SearchDataDto> search(SearchUserDto searchUserDto) async {
    late Response<dynamic> response;
    late SearchDataDto searchData;
    try {
      final Map<String, dynamic> rawData = <String, dynamic>{
        'searchQuery': searchUserDto.querySearch,
        'page': searchUserDto.page,
      };

      response = await dio.get(
        '${config.quickChatService}/search',
        data: jsonEncode(rawData),
      );

      searchData = await Isolate.run(() {
        final Map<String, dynamic> result = response.data['data'];
        return SearchDataDto.fromJson(result);
      });
    } on DioException catch (e) {
      throw checkErrResponse(e.response);
    } catch (e) {
      throw checkErrResponse(response);
    }

    if (response.statusCode == 200) {
      return searchData;
    } else {
      throw checkErrResponse(response);
    }
  }
}
