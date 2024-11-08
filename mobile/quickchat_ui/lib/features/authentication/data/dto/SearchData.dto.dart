import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quickchat_ui/features/authentication/data/dto/UserData.dto.dart';

part 'SearchData.dto.freezed.dart';
part 'SearchData.dto.g.dart';

@freezed
class SearchDataDto with _$SearchDataDto {
  const factory SearchDataDto({
    required int currentPage,
    required int maxPage,
    required List<UserDataDto> users,
  }) = _SearchDataDto;

  const SearchDataDto._();

  factory SearchDataDto.fromJson(Map<String, dynamic> json) =>
      _$SearchDataDtoFromJson(json);

  Map<String, dynamic> toPersistence() {
    return <String, dynamic>{
      'currentPage': currentPage,
      'maxPage': maxPage,
      'users': users,
    };
  }
}
