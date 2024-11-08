import 'package:freezed_annotation/freezed_annotation.dart';

part 'RegisterUser.dto.freezed.dart';

@freezed
class RegisterUserDto with _$RegisterUserDto {
  const factory RegisterUserDto({
    required String name,
    required String username,
    required String password,
  }) = _RegisterUserDto;

  const RegisterUserDto._();
}
