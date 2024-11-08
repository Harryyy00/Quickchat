// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ConversationsData.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConversationsDataDtoImpl _$$ConversationsDataDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ConversationsDataDtoImpl(
      currentPage: (json['currentPage'] as num).toInt(),
      maxPage: (json['maxPage'] as num).toInt(),
      conversationsList: (json['conversationsList'] as List<dynamic>)
          .map((e) => ConversationsDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ConversationsDataDtoImplToJson(
        _$ConversationsDataDtoImpl instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'maxPage': instance.maxPage,
      'conversationsList': instance.conversationsList,
    };
