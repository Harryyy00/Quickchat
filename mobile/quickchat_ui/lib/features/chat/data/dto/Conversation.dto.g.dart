// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Conversation.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConversationDtoImpl _$$ConversationDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ConversationDtoImpl(
      sender: json['sender'] as String,
      recipient: json['recipient'] as String,
      lastMessage: json['lastMessage'] as String,
      timeStamp: DateTime.parse(json['timeStamp'] as String),
      conversationsId: json['conversationsId'] as String,
    );

Map<String, dynamic> _$$ConversationDtoImplToJson(
        _$ConversationDtoImpl instance) =>
    <String, dynamic>{
      'sender': instance.sender,
      'recipient': instance.recipient,
      'lastMessage': instance.lastMessage,
      'timeStamp': instance.timeStamp.toIso8601String(),
      'conversationsId': instance.conversationsId,
    };
