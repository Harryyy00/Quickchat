import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quickchat_ui/features/chat/data/dto/Conversations.dto.dart';

part 'ConversationsData.dto.freezed.dart';
part 'ConversationsData.dto.g.dart';

@freezed
class ConversationsDataDto with _$ConversationsDataDto {
  const factory ConversationsDataDto({
    required int currentPage,
    required int maxPage,
    required List<ConversationsDto> conversationsList,
  }) = _ConversationsDataDto;

  const ConversationsDataDto._();

  factory ConversationsDataDto.fromJson(Map<String, dynamic> json) =>
      _$ConversationsDataDtoFromJson(json);

  Map<String, dynamic> toPersistence() {
    return <String, dynamic>{
      'sender': currentPage,
      'recipient': maxPage,
      'lastMessage': conversationsList,
    };
  }
}
