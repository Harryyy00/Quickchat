// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ConversationData.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConversationDataDtoImpl _$$ConversationDataDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ConversationDataDtoImpl(
      currentPage: (json['currentPage'] as num).toInt(),
      maxPage: (json['maxPage'] as num).toInt(),
      conversationList: (json['conversationList'] as List<dynamic>)
          .map((e) => ConversationDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ConversationDataDtoImplToJson(
        _$ConversationDataDtoImpl instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'maxPage': instance.maxPage,
      'conversationList': instance.conversationList,
    };
