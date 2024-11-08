part of 'user_bloc.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    String? errorMessage,
    required StateStatus stateStatus,
    UserDataDto? selectedUser,
    SearchDataDto? search,
    required List<UserDataDto> searchList,
  }) = _UserState;

  factory UserState.initial() => const UserState(
        stateStatus: StateStatus.initialState,
        searchList: <UserDataDto>[],
      );
}
