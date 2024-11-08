import 'package:freezed_annotation/freezed_annotation.dart';

part 'Conversations.dto.freezed.dart';
part 'Conversations.dto.g.dart';

@freezed
class ConversationsDto with _$ConversationsDto {
  const factory ConversationsDto({
    // required String id,
    required String sender,
    required String recipient,
    required DateTime sentAt,
    required String content,
  }) = _ConversationsDto;

  const ConversationsDto._();

  factory ConversationsDto.fromJson(Map<String, dynamic> json) =>
      _$ConversationsDtoFromJson(json);

  Map<String, dynamic> toPersistence() {
    return <String, dynamic>{
      // 'id': id,
      'sender': sender,
      'recipient': recipient,
      'sentAt': sentAt,
      'content': content,
    };
  }
}
