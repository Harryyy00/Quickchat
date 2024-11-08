import 'package:freezed_annotation/freezed_annotation.dart';

part 'GetConversations.dto.freezed.dart';

@freezed
class GetConversationsDto with _$GetConversationsDto {
  const factory GetConversationsDto({
    required String conversationsId,
    required int page,
  }) = _GetConversationsDto;

  const GetConversationsDto._();

  Map<String, dynamic> toPersistence() {
    return <String, dynamic>{
      'conversationsId': conversationsId,
      'page': page,
    };
  }
}
