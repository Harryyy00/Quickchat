import 'package:freezed_annotation/freezed_annotation.dart';

part 'Conversation.dto.freezed.dart';
part 'Conversation.dto.g.dart';

@freezed
class ConversationDto with _$ConversationDto {
  const factory ConversationDto({
    required String sender,
    required String recipient,
    required String lastMessage,
    required String timeStamp,
    required String conversationsId,
  }) = _ConversationDto;

  const ConversationDto._();

  factory ConversationDto.fromJson(Map<String, dynamic> json) =>
      _$ConversationDtoFromJson(json);

  Map<String, dynamic> toPersistence() {
    return <String, dynamic>{
      'sender': sender,
      'recipient': recipient,
      'lastMessage': lastMessage,
      'timeStamp': timeStamp,
      'conversationsId': conversationsId,
    };
  }
}
