// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Conversations.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConversationsDtoImpl _$$ConversationsDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ConversationsDtoImpl(
      sender: json['sender'] as String,
      recipient: json['recipient'] as String,
      sentAt: DateTime.parse(json['sentAt'] as String),
      content: json['content'] as String,
    );

Map<String, dynamic> _$$ConversationsDtoImplToJson(
        _$ConversationsDtoImpl instance) =>
    <String, dynamic>{
      'sender': instance.sender,
      'recipient': instance.recipient,
      'sentAt': instance.sentAt.toIso8601String(),
      'content': instance.content,
    };
