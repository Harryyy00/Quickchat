import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quickchat_ui/core/logic/state_status.dart';

part 'SearchUser.dto.freezed.dart';

@freezed
class SearchUserDto with _$SearchUserDto {
  const factory SearchUserDto({
    required StateStatus stateStatus,
    required String querySearch,
    required int page,
  }) = _SearchUserDto;

  const SearchUserDto._();
}
