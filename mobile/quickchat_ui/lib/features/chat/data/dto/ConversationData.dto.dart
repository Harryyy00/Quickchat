import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quickchat_ui/features/chat/data/dto/Conversation.dto.dart';

part 'ConversationData.dto.freezed.dart';
part 'ConversationData.dto.g.dart';

@freezed
class ConversationDataDto with _$ConversationDataDto {
  const factory ConversationDataDto({
    required int currentPage,
    required int maxPage,
    required List<ConversationDto> conversationList,
  }) = _ConversationDataDto;

  const ConversationDataDto._();

  factory ConversationDataDto.fromJson(Map<String, dynamic> json) =>
      _$ConversationDataDtoFromJson(json);

  Map<String, dynamic> toPersistence() {
    return <String, dynamic>{
      'currentPage': currentPage,
      'maxPage': maxPage,
      'conversationList': conversationList,
    };
  }
}
