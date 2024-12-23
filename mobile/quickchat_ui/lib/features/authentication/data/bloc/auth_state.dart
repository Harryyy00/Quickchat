part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    required bool hasRegisteredUser,
    required LoginDatasDto? loginDatas,
    String? errorMessage,
    required StateStatus stateStatus,
    required NavigatePage navigatePage,
    required AuthStatus authStatus,
  }) = _AuthState;

  factory AuthState.initial() => const AuthState(
        hasRegisteredUser: false,
        loginDatas: null,
        stateStatus: StateStatus.initialState,
        navigatePage: NavigatePage.loginPage,
        authStatus: AuthStatus.unauthenticated,
      );
}
