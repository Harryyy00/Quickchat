// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(StateStatus stateStatus, String userId) getUser,
    required TResult Function(SearchUserDto searchUserDto) search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(StateStatus stateStatus, String userId)? getUser,
    TResult? Function(SearchUserDto searchUserDto)? search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(StateStatus stateStatus, String userId)? getUser,
    TResult Function(SearchUserDto searchUserDto)? search,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUser value) getUser,
    required TResult Function(_Search value) search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUser value)? getUser,
    TResult? Function(_Search value)? search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUser value)? getUser,
    TResult Function(_Search value)? search,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEventCopyWith<$Res> {
  factory $UserEventCopyWith(UserEvent value, $Res Function(UserEvent) then) =
      _$UserEventCopyWithImpl<$Res, UserEvent>;
}

/// @nodoc
class _$UserEventCopyWithImpl<$Res, $Val extends UserEvent>
    implements $UserEventCopyWith<$Res> {
  _$UserEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetUserImplCopyWith<$Res> {
  factory _$$GetUserImplCopyWith(
          _$GetUserImpl value, $Res Function(_$GetUserImpl) then) =
      __$$GetUserImplCopyWithImpl<$Res>;
  @useResult
  $Res call({StateStatus stateStatus, String userId});
}

/// @nodoc
class __$$GetUserImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$GetUserImpl>
    implements _$$GetUserImplCopyWith<$Res> {
  __$$GetUserImplCopyWithImpl(
      _$GetUserImpl _value, $Res Function(_$GetUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stateStatus = null,
    Object? userId = null,
  }) {
    return _then(_$GetUserImpl(
      stateStatus: null == stateStatus
          ? _value.stateStatus
          : stateStatus // ignore: cast_nullable_to_non_nullable
              as StateStatus,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetUserImpl implements _GetUser {
  const _$GetUserImpl({required this.stateStatus, required this.userId});

  @override
  final StateStatus stateStatus;
  @override
  final String userId;

  @override
  String toString() {
    return 'UserEvent.getUser(stateStatus: $stateStatus, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUserImpl &&
            (identical(other.stateStatus, stateStatus) ||
                other.stateStatus == stateStatus) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stateStatus, userId);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetUserImplCopyWith<_$GetUserImpl> get copyWith =>
      __$$GetUserImplCopyWithImpl<_$GetUserImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(StateStatus stateStatus, String userId) getUser,
    required TResult Function(SearchUserDto searchUserDto) search,
  }) {
    return getUser(stateStatus, userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(StateStatus stateStatus, String userId)? getUser,
    TResult? Function(SearchUserDto searchUserDto)? search,
  }) {
    return getUser?.call(stateStatus, userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(StateStatus stateStatus, String userId)? getUser,
    TResult Function(SearchUserDto searchUserDto)? search,
    required TResult orElse(),
  }) {
    if (getUser != null) {
      return getUser(stateStatus, userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUser value) getUser,
    required TResult Function(_Search value) search,
  }) {
    return getUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUser value)? getUser,
    TResult? Function(_Search value)? search,
  }) {
    return getUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUser value)? getUser,
    TResult Function(_Search value)? search,
    required TResult orElse(),
  }) {
    if (getUser != null) {
      return getUser(this);
    }
    return orElse();
  }
}

abstract class _GetUser implements UserEvent {
  const factory _GetUser(
      {required final StateStatus stateStatus,
      required final String userId}) = _$GetUserImpl;

  StateStatus get stateStatus;
  String get userId;

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetUserImplCopyWith<_$GetUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchImplCopyWith<$Res> {
  factory _$$SearchImplCopyWith(
          _$SearchImpl value, $Res Function(_$SearchImpl) then) =
      __$$SearchImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SearchUserDto searchUserDto});

  $SearchUserDtoCopyWith<$Res> get searchUserDto;
}

/// @nodoc
class __$$SearchImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$SearchImpl>
    implements _$$SearchImplCopyWith<$Res> {
  __$$SearchImplCopyWithImpl(
      _$SearchImpl _value, $Res Function(_$SearchImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchUserDto = null,
  }) {
    return _then(_$SearchImpl(
      searchUserDto: null == searchUserDto
          ? _value.searchUserDto
          : searchUserDto // ignore: cast_nullable_to_non_nullable
              as SearchUserDto,
    ));
  }

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchUserDtoCopyWith<$Res> get searchUserDto {
    return $SearchUserDtoCopyWith<$Res>(_value.searchUserDto, (value) {
      return _then(_value.copyWith(searchUserDto: value));
    });
  }
}

/// @nodoc

class _$SearchImpl implements _Search {
  const _$SearchImpl({required this.searchUserDto});

  @override
  final SearchUserDto searchUserDto;

  @override
  String toString() {
    return 'UserEvent.search(searchUserDto: $searchUserDto)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchImpl &&
            (identical(other.searchUserDto, searchUserDto) ||
                other.searchUserDto == searchUserDto));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchUserDto);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchImplCopyWith<_$SearchImpl> get copyWith =>
      __$$SearchImplCopyWithImpl<_$SearchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(StateStatus stateStatus, String userId) getUser,
    required TResult Function(SearchUserDto searchUserDto) search,
  }) {
    return search(searchUserDto);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(StateStatus stateStatus, String userId)? getUser,
    TResult? Function(SearchUserDto searchUserDto)? search,
  }) {
    return search?.call(searchUserDto);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(StateStatus stateStatus, String userId)? getUser,
    TResult Function(SearchUserDto searchUserDto)? search,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(searchUserDto);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUser value) getUser,
    required TResult Function(_Search value) search,
  }) {
    return search(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUser value)? getUser,
    TResult? Function(_Search value)? search,
  }) {
    return search?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUser value)? getUser,
    TResult Function(_Search value)? search,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(this);
    }
    return orElse();
  }
}

abstract class _Search implements UserEvent {
  const factory _Search({required final SearchUserDto searchUserDto}) =
      _$SearchImpl;

  SearchUserDto get searchUserDto;

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchImplCopyWith<_$SearchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserState {
  String? get errorMessage => throw _privateConstructorUsedError;
  StateStatus get stateStatus => throw _privateConstructorUsedError;
  UserDataDto? get selectedUser => throw _privateConstructorUsedError;
  SearchDataDto? get search => throw _privateConstructorUsedError;
  List<UserDataDto> get searchList => throw _privateConstructorUsedError;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserStateCopyWith<UserState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res, UserState>;
  @useResult
  $Res call(
      {String? errorMessage,
      StateStatus stateStatus,
      UserDataDto? selectedUser,
      SearchDataDto? search,
      List<UserDataDto> searchList});

  $UserDataDtoCopyWith<$Res>? get selectedUser;
  $SearchDataDtoCopyWith<$Res>? get search;
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res, $Val extends UserState>
    implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
    Object? stateStatus = null,
    Object? selectedUser = freezed,
    Object? search = freezed,
    Object? searchList = null,
  }) {
    return _then(_value.copyWith(
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      stateStatus: null == stateStatus
          ? _value.stateStatus
          : stateStatus // ignore: cast_nullable_to_non_nullable
              as StateStatus,
      selectedUser: freezed == selectedUser
          ? _value.selectedUser
          : selectedUser // ignore: cast_nullable_to_non_nullable
              as UserDataDto?,
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as SearchDataDto?,
      searchList: null == searchList
          ? _value.searchList
          : searchList // ignore: cast_nullable_to_non_nullable
              as List<UserDataDto>,
    ) as $Val);
  }

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserDataDtoCopyWith<$Res>? get selectedUser {
    if (_value.selectedUser == null) {
      return null;
    }

    return $UserDataDtoCopyWith<$Res>(_value.selectedUser!, (value) {
      return _then(_value.copyWith(selectedUser: value) as $Val);
    });
  }

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchDataDtoCopyWith<$Res>? get search {
    if (_value.search == null) {
      return null;
    }

    return $SearchDataDtoCopyWith<$Res>(_value.search!, (value) {
      return _then(_value.copyWith(search: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserStateImplCopyWith<$Res>
    implements $UserStateCopyWith<$Res> {
  factory _$$UserStateImplCopyWith(
          _$UserStateImpl value, $Res Function(_$UserStateImpl) then) =
      __$$UserStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? errorMessage,
      StateStatus stateStatus,
      UserDataDto? selectedUser,
      SearchDataDto? search,
      List<UserDataDto> searchList});

  @override
  $UserDataDtoCopyWith<$Res>? get selectedUser;
  @override
  $SearchDataDtoCopyWith<$Res>? get search;
}

/// @nodoc
class __$$UserStateImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$UserStateImpl>
    implements _$$UserStateImplCopyWith<$Res> {
  __$$UserStateImplCopyWithImpl(
      _$UserStateImpl _value, $Res Function(_$UserStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
    Object? stateStatus = null,
    Object? selectedUser = freezed,
    Object? search = freezed,
    Object? searchList = null,
  }) {
    return _then(_$UserStateImpl(
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      stateStatus: null == stateStatus
          ? _value.stateStatus
          : stateStatus // ignore: cast_nullable_to_non_nullable
              as StateStatus,
      selectedUser: freezed == selectedUser
          ? _value.selectedUser
          : selectedUser // ignore: cast_nullable_to_non_nullable
              as UserDataDto?,
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as SearchDataDto?,
      searchList: null == searchList
          ? _value._searchList
          : searchList // ignore: cast_nullable_to_non_nullable
              as List<UserDataDto>,
    ));
  }
}

/// @nodoc

class _$UserStateImpl implements _UserState {
  const _$UserStateImpl(
      {this.errorMessage,
      required this.stateStatus,
      this.selectedUser,
      this.search,
      required final List<UserDataDto> searchList})
      : _searchList = searchList;

  @override
  final String? errorMessage;
  @override
  final StateStatus stateStatus;
  @override
  final UserDataDto? selectedUser;
  @override
  final SearchDataDto? search;
  final List<UserDataDto> _searchList;
  @override
  List<UserDataDto> get searchList {
    if (_searchList is EqualUnmodifiableListView) return _searchList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchList);
  }

  @override
  String toString() {
    return 'UserState(errorMessage: $errorMessage, stateStatus: $stateStatus, selectedUser: $selectedUser, search: $search, searchList: $searchList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserStateImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.stateStatus, stateStatus) ||
                other.stateStatus == stateStatus) &&
            (identical(other.selectedUser, selectedUser) ||
                other.selectedUser == selectedUser) &&
            (identical(other.search, search) || other.search == search) &&
            const DeepCollectionEquality()
                .equals(other._searchList, _searchList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage, stateStatus,
      selectedUser, search, const DeepCollectionEquality().hash(_searchList));

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserStateImplCopyWith<_$UserStateImpl> get copyWith =>
      __$$UserStateImplCopyWithImpl<_$UserStateImpl>(this, _$identity);
}

abstract class _UserState implements UserState {
  const factory _UserState(
      {final String? errorMessage,
      required final StateStatus stateStatus,
      final UserDataDto? selectedUser,
      final SearchDataDto? search,
      required final List<UserDataDto> searchList}) = _$UserStateImpl;

  @override
  String? get errorMessage;
  @override
  StateStatus get stateStatus;
  @override
  UserDataDto? get selectedUser;
  @override
  SearchDataDto? get search;
  @override
  List<UserDataDto> get searchList;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserStateImplCopyWith<_$UserStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
