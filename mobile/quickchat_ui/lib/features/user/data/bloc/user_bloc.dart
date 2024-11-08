import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:quickchat_ui/core/logic/result.dart';
import 'package:quickchat_ui/core/logic/state_status.dart';
import 'package:quickchat_ui/features/authentication/data/dto/SearchData.dto.dart';
import 'package:quickchat_ui/features/authentication/data/dto/SearchUser.dto.dart';
import 'package:quickchat_ui/features/authentication/data/dto/UserData.dto.dart';
import 'package:quickchat_ui/features/user/domain/repositories/user_repository.dart';

part 'user_bloc.freezed.dart';
part 'user_event.dart';
part 'user_state.dart';

@lazySingleton
class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc({
    required this.userRepository,
  }) : super(UserState.initial()) {
    on<_GetUser>((_GetUser event, Emitter<UserState> emit) async {
      emit(state.copyWith(stateStatus: event.stateStatus));
      final Result<UserDataDto> result =
          await userRepository.getUser(event.userId);
      if (result.isFailure) {
        emit(state.copyWith(
          stateStatus: StateStatus.errorState,
          errorMessage: result.getError,
        ));
        emit(state.copyWith(
          stateStatus: StateStatus.loadedState,
        ));
      } else {
        emit(state.copyWith(
          selectedUser: result.getValue,
          stateStatus: StateStatus.loadedState,
        ));
      }
    });

    on<_Search>((_Search event, Emitter<UserState> emit) async {
      emit(state.copyWith(stateStatus: event.searchUserDto.stateStatus));
      final Result<SearchDataDto> result =
          await userRepository.search(event.searchUserDto);
      if (result.isFailure) {
        emit(state.copyWith(
          stateStatus: StateStatus.errorState,
          errorMessage: result.getError,
        ));
        emit(state.copyWith(
          stateStatus: StateStatus.loadedState,
        ));
      } else {
        final SearchDataDto search = result.getValue;
        final List<UserDataDto> resultList = search.users.toList();
        final int page = event.searchUserDto.page;
        final List<UserDataDto> updatedList =
            _getUpdatedList<UserDataDto>(state.searchList, resultList, page);

        emit(state.copyWith(
          search: search,
          searchList: updatedList,
          stateStatus: StateStatus.loadedState,
        ));
      }
    });
  }

  final UserRepository userRepository;

  List<T> _getUpdatedList<T>(
      List<T> currentList, List<T> resultList, int page) {
    final List<T> updatedList = <T>[];
    if (page != 1) {
      updatedList.addAll(currentList);
    }
    for (final T value in resultList) {
      if (!updatedList.contains(value)) {
        updatedList.add(value);
      } else {
        final int index =
            updatedList.indexWhere((T element) => element == value);
        if (index != 0) {
          updatedList.replaceRange(index, index + 1, <T>[value]);
        }
      }
    }
    return updatedList;
  }
}
