// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SearchData.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchDataDtoImpl _$$SearchDataDtoImplFromJson(Map<String, dynamic> json) =>
    _$SearchDataDtoImpl(
      currentPage: (json['currentPage'] as num).toInt(),
      maxPage: (json['maxPage'] as num).toInt(),
      users: (json['users'] as List<dynamic>)
          .map((e) => UserDataDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SearchDataDtoImplToJson(_$SearchDataDtoImpl instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'maxPage': instance.maxPage,
      'users': instance.users,
    };
