part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.getUser({
    required StateStatus stateStatus,
    required String userId,
  }) = _GetUser;

  const factory UserEvent.search({
    required SearchUserDto searchUserDto,
  }) = _Search;
}
