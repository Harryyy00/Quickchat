// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChatsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connectChatStream,
    required TResult Function() disposeChatStream,
    required TResult Function(StateStatus stateStatus, int page)
        getConversation,
    required TResult Function(
            StateStatus stateStatus, GetConversationsDto getConversations)
        getConversations,
    required TResult Function() disposeChatData,
    required TResult Function(String recipient, String content) sendChat,
    required TResult Function(StateStatus stateStatus, String? errorMessage)
        changeStateStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? connectChatStream,
    TResult? Function()? disposeChatStream,
    TResult? Function(StateStatus stateStatus, int page)? getConversation,
    TResult? Function(
            StateStatus stateStatus, GetConversationsDto getConversations)?
        getConversations,
    TResult? Function()? disposeChatData,
    TResult? Function(String recipient, String content)? sendChat,
    TResult? Function(StateStatus stateStatus, String? errorMessage)?
        changeStateStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connectChatStream,
    TResult Function()? disposeChatStream,
    TResult Function(StateStatus stateStatus, int page)? getConversation,
    TResult Function(
            StateStatus stateStatus, GetConversationsDto getConversations)?
        getConversations,
    TResult Function()? disposeChatData,
    TResult Function(String recipient, String content)? sendChat,
    TResult Function(StateStatus stateStatus, String? errorMessage)?
        changeStateStatus,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ConnectChatStream value) connectChatStream,
    required TResult Function(_DisposeChatStream value) disposeChatStream,
    required TResult Function(_GetConversation value) getConversation,
    required TResult Function(_GetConversations value) getConversations,
    required TResult Function(_DisposeChatData value) disposeChatData,
    required TResult Function(_SendChat value) sendChat,
    required TResult Function(_ChangeStateStatus value) changeStateStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ConnectChatStream value)? connectChatStream,
    TResult? Function(_DisposeChatStream value)? disposeChatStream,
    TResult? Function(_GetConversation value)? getConversation,
    TResult? Function(_GetConversations value)? getConversations,
    TResult? Function(_DisposeChatData value)? disposeChatData,
    TResult? Function(_SendChat value)? sendChat,
    TResult? Function(_ChangeStateStatus value)? changeStateStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ConnectChatStream value)? connectChatStream,
    TResult Function(_DisposeChatStream value)? disposeChatStream,
    TResult Function(_GetConversation value)? getConversation,
    TResult Function(_GetConversations value)? getConversations,
    TResult Function(_DisposeChatData value)? disposeChatData,
    TResult Function(_SendChat value)? sendChat,
    TResult Function(_ChangeStateStatus value)? changeStateStatus,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatsEventCopyWith<$Res> {
  factory $ChatsEventCopyWith(
          ChatsEvent value, $Res Function(ChatsEvent) then) =
      _$ChatsEventCopyWithImpl<$Res, ChatsEvent>;
}

/// @nodoc
class _$ChatsEventCopyWithImpl<$Res, $Val extends ChatsEvent>
    implements $ChatsEventCopyWith<$Res> {
  _$ChatsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ConnectChatStreamImplCopyWith<$Res> {
  factory _$$ConnectChatStreamImplCopyWith(_$ConnectChatStreamImpl value,
          $Res Function(_$ConnectChatStreamImpl) then) =
      __$$ConnectChatStreamImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ConnectChatStreamImplCopyWithImpl<$Res>
    extends _$ChatsEventCopyWithImpl<$Res, _$ConnectChatStreamImpl>
    implements _$$ConnectChatStreamImplCopyWith<$Res> {
  __$$ConnectChatStreamImplCopyWithImpl(_$ConnectChatStreamImpl _value,
      $Res Function(_$ConnectChatStreamImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ConnectChatStreamImpl implements _ConnectChatStream {
  const _$ConnectChatStreamImpl();

  @override
  String toString() {
    return 'ChatsEvent.connectChatStream()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ConnectChatStreamImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connectChatStream,
    required TResult Function() disposeChatStream,
    required TResult Function(StateStatus stateStatus, int page)
        getConversation,
    required TResult Function(
            StateStatus stateStatus, GetConversationsDto getConversations)
        getConversations,
    required TResult Function() disposeChatData,
    required TResult Function(String recipient, String content) sendChat,
    required TResult Function(StateStatus stateStatus, String? errorMessage)
        changeStateStatus,
  }) {
    return connectChatStream();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? connectChatStream,
    TResult? Function()? disposeChatStream,
    TResult? Function(StateStatus stateStatus, int page)? getConversation,
    TResult? Function(
            StateStatus stateStatus, GetConversationsDto getConversations)?
        getConversations,
    TResult? Function()? disposeChatData,
    TResult? Function(String recipient, String content)? sendChat,
    TResult? Function(StateStatus stateStatus, String? errorMessage)?
        changeStateStatus,
  }) {
    return connectChatStream?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connectChatStream,
    TResult Function()? disposeChatStream,
    TResult Function(StateStatus stateStatus, int page)? getConversation,
    TResult Function(
            StateStatus stateStatus, GetConversationsDto getConversations)?
        getConversations,
    TResult Function()? disposeChatData,
    TResult Function(String recipient, String content)? sendChat,
    TResult Function(StateStatus stateStatus, String? errorMessage)?
        changeStateStatus,
    required TResult orElse(),
  }) {
    if (connectChatStream != null) {
      return connectChatStream();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ConnectChatStream value) connectChatStream,
    required TResult Function(_DisposeChatStream value) disposeChatStream,
    required TResult Function(_GetConversation value) getConversation,
    required TResult Function(_GetConversations value) getConversations,
    required TResult Function(_DisposeChatData value) disposeChatData,
    required TResult Function(_SendChat value) sendChat,
    required TResult Function(_ChangeStateStatus value) changeStateStatus,
  }) {
    return connectChatStream(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ConnectChatStream value)? connectChatStream,
    TResult? Function(_DisposeChatStream value)? disposeChatStream,
    TResult? Function(_GetConversation value)? getConversation,
    TResult? Function(_GetConversations value)? getConversations,
    TResult? Function(_DisposeChatData value)? disposeChatData,
    TResult? Function(_SendChat value)? sendChat,
    TResult? Function(_ChangeStateStatus value)? changeStateStatus,
  }) {
    return connectChatStream?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ConnectChatStream value)? connectChatStream,
    TResult Function(_DisposeChatStream value)? disposeChatStream,
    TResult Function(_GetConversation value)? getConversation,
    TResult Function(_GetConversations value)? getConversations,
    TResult Function(_DisposeChatData value)? disposeChatData,
    TResult Function(_SendChat value)? sendChat,
    TResult Function(_ChangeStateStatus value)? changeStateStatus,
    required TResult orElse(),
  }) {
    if (connectChatStream != null) {
      return connectChatStream(this);
    }
    return orElse();
  }
}

abstract class _ConnectChatStream implements ChatsEvent {
  const factory _ConnectChatStream() = _$ConnectChatStreamImpl;
}

/// @nodoc
abstract class _$$DisposeChatStreamImplCopyWith<$Res> {
  factory _$$DisposeChatStreamImplCopyWith(_$DisposeChatStreamImpl value,
          $Res Function(_$DisposeChatStreamImpl) then) =
      __$$DisposeChatStreamImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DisposeChatStreamImplCopyWithImpl<$Res>
    extends _$ChatsEventCopyWithImpl<$Res, _$DisposeChatStreamImpl>
    implements _$$DisposeChatStreamImplCopyWith<$Res> {
  __$$DisposeChatStreamImplCopyWithImpl(_$DisposeChatStreamImpl _value,
      $Res Function(_$DisposeChatStreamImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DisposeChatStreamImpl implements _DisposeChatStream {
  const _$DisposeChatStreamImpl();

  @override
  String toString() {
    return 'ChatsEvent.disposeChatStream()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DisposeChatStreamImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connectChatStream,
    required TResult Function() disposeChatStream,
    required TResult Function(StateStatus stateStatus, int page)
        getConversation,
    required TResult Function(
            StateStatus stateStatus, GetConversationsDto getConversations)
        getConversations,
    required TResult Function() disposeChatData,
    required TResult Function(String recipient, String content) sendChat,
    required TResult Function(StateStatus stateStatus, String? errorMessage)
        changeStateStatus,
  }) {
    return disposeChatStream();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? connectChatStream,
    TResult? Function()? disposeChatStream,
    TResult? Function(StateStatus stateStatus, int page)? getConversation,
    TResult? Function(
            StateStatus stateStatus, GetConversationsDto getConversations)?
        getConversations,
    TResult? Function()? disposeChatData,
    TResult? Function(String recipient, String content)? sendChat,
    TResult? Function(StateStatus stateStatus, String? errorMessage)?
        changeStateStatus,
  }) {
    return disposeChatStream?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connectChatStream,
    TResult Function()? disposeChatStream,
    TResult Function(StateStatus stateStatus, int page)? getConversation,
    TResult Function(
            StateStatus stateStatus, GetConversationsDto getConversations)?
        getConversations,
    TResult Function()? disposeChatData,
    TResult Function(String recipient, String content)? sendChat,
    TResult Function(StateStatus stateStatus, String? errorMessage)?
        changeStateStatus,
    required TResult orElse(),
  }) {
    if (disposeChatStream != null) {
      return disposeChatStream();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ConnectChatStream value) connectChatStream,
    required TResult Function(_DisposeChatStream value) disposeChatStream,
    required TResult Function(_GetConversation value) getConversation,
    required TResult Function(_GetConversations value) getConversations,
    required TResult Function(_DisposeChatData value) disposeChatData,
    required TResult Function(_SendChat value) sendChat,
    required TResult Function(_ChangeStateStatus value) changeStateStatus,
  }) {
    return disposeChatStream(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ConnectChatStream value)? connectChatStream,
    TResult? Function(_DisposeChatStream value)? disposeChatStream,
    TResult? Function(_GetConversation value)? getConversation,
    TResult? Function(_GetConversations value)? getConversations,
    TResult? Function(_DisposeChatData value)? disposeChatData,
    TResult? Function(_SendChat value)? sendChat,
    TResult? Function(_ChangeStateStatus value)? changeStateStatus,
  }) {
    return disposeChatStream?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ConnectChatStream value)? connectChatStream,
    TResult Function(_DisposeChatStream value)? disposeChatStream,
    TResult Function(_GetConversation value)? getConversation,
    TResult Function(_GetConversations value)? getConversations,
    TResult Function(_DisposeChatData value)? disposeChatData,
    TResult Function(_SendChat value)? sendChat,
    TResult Function(_ChangeStateStatus value)? changeStateStatus,
    required TResult orElse(),
  }) {
    if (disposeChatStream != null) {
      return disposeChatStream(this);
    }
    return orElse();
  }
}

abstract class _DisposeChatStream implements ChatsEvent {
  const factory _DisposeChatStream() = _$DisposeChatStreamImpl;
}

/// @nodoc
abstract class _$$GetConversationImplCopyWith<$Res> {
  factory _$$GetConversationImplCopyWith(_$GetConversationImpl value,
          $Res Function(_$GetConversationImpl) then) =
      __$$GetConversationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({StateStatus stateStatus, int page});
}

/// @nodoc
class __$$GetConversationImplCopyWithImpl<$Res>
    extends _$ChatsEventCopyWithImpl<$Res, _$GetConversationImpl>
    implements _$$GetConversationImplCopyWith<$Res> {
  __$$GetConversationImplCopyWithImpl(
      _$GetConversationImpl _value, $Res Function(_$GetConversationImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stateStatus = null,
    Object? page = null,
  }) {
    return _then(_$GetConversationImpl(
      stateStatus: null == stateStatus
          ? _value.stateStatus
          : stateStatus // ignore: cast_nullable_to_non_nullable
              as StateStatus,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GetConversationImpl implements _GetConversation {
  const _$GetConversationImpl({required this.stateStatus, required this.page});

  @override
  final StateStatus stateStatus;
  @override
  final int page;

  @override
  String toString() {
    return 'ChatsEvent.getConversation(stateStatus: $stateStatus, page: $page)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetConversationImpl &&
            (identical(other.stateStatus, stateStatus) ||
                other.stateStatus == stateStatus) &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stateStatus, page);

  /// Create a copy of ChatsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetConversationImplCopyWith<_$GetConversationImpl> get copyWith =>
      __$$GetConversationImplCopyWithImpl<_$GetConversationImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connectChatStream,
    required TResult Function() disposeChatStream,
    required TResult Function(StateStatus stateStatus, int page)
        getConversation,
    required TResult Function(
            StateStatus stateStatus, GetConversationsDto getConversations)
        getConversations,
    required TResult Function() disposeChatData,
    required TResult Function(String recipient, String content) sendChat,
    required TResult Function(StateStatus stateStatus, String? errorMessage)
        changeStateStatus,
  }) {
    return getConversation(stateStatus, page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? connectChatStream,
    TResult? Function()? disposeChatStream,
    TResult? Function(StateStatus stateStatus, int page)? getConversation,
    TResult? Function(
            StateStatus stateStatus, GetConversationsDto getConversations)?
        getConversations,
    TResult? Function()? disposeChatData,
    TResult? Function(String recipient, String content)? sendChat,
    TResult? Function(StateStatus stateStatus, String? errorMessage)?
        changeStateStatus,
  }) {
    return getConversation?.call(stateStatus, page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connectChatStream,
    TResult Function()? disposeChatStream,
    TResult Function(StateStatus stateStatus, int page)? getConversation,
    TResult Function(
            StateStatus stateStatus, GetConversationsDto getConversations)?
        getConversations,
    TResult Function()? disposeChatData,
    TResult Function(String recipient, String content)? sendChat,
    TResult Function(StateStatus stateStatus, String? errorMessage)?
        changeStateStatus,
    required TResult orElse(),
  }) {
    if (getConversation != null) {
      return getConversation(stateStatus, page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ConnectChatStream value) connectChatStream,
    required TResult Function(_DisposeChatStream value) disposeChatStream,
    required TResult Function(_GetConversation value) getConversation,
    required TResult Function(_GetConversations value) getConversations,
    required TResult Function(_DisposeChatData value) disposeChatData,
    required TResult Function(_SendChat value) sendChat,
    required TResult Function(_ChangeStateStatus value) changeStateStatus,
  }) {
    return getConversation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ConnectChatStream value)? connectChatStream,
    TResult? Function(_DisposeChatStream value)? disposeChatStream,
    TResult? Function(_GetConversation value)? getConversation,
    TResult? Function(_GetConversations value)? getConversations,
    TResult? Function(_DisposeChatData value)? disposeChatData,
    TResult? Function(_SendChat value)? sendChat,
    TResult? Function(_ChangeStateStatus value)? changeStateStatus,
  }) {
    return getConversation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ConnectChatStream value)? connectChatStream,
    TResult Function(_DisposeChatStream value)? disposeChatStream,
    TResult Function(_GetConversation value)? getConversation,
    TResult Function(_GetConversations value)? getConversations,
    TResult Function(_DisposeChatData value)? disposeChatData,
    TResult Function(_SendChat value)? sendChat,
    TResult Function(_ChangeStateStatus value)? changeStateStatus,
    required TResult orElse(),
  }) {
    if (getConversation != null) {
      return getConversation(this);
    }
    return orElse();
  }
}

abstract class _GetConversation implements ChatsEvent {
  const factory _GetConversation(
      {required final StateStatus stateStatus,
      required final int page}) = _$GetConversationImpl;

  StateStatus get stateStatus;
  int get page;

  /// Create a copy of ChatsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetConversationImplCopyWith<_$GetConversationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetConversationsImplCopyWith<$Res> {
  factory _$$GetConversationsImplCopyWith(_$GetConversationsImpl value,
          $Res Function(_$GetConversationsImpl) then) =
      __$$GetConversationsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({StateStatus stateStatus, GetConversationsDto getConversations});

  $GetConversationsDtoCopyWith<$Res> get getConversations;
}

/// @nodoc
class __$$GetConversationsImplCopyWithImpl<$Res>
    extends _$ChatsEventCopyWithImpl<$Res, _$GetConversationsImpl>
    implements _$$GetConversationsImplCopyWith<$Res> {
  __$$GetConversationsImplCopyWithImpl(_$GetConversationsImpl _value,
      $Res Function(_$GetConversationsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stateStatus = null,
    Object? getConversations = null,
  }) {
    return _then(_$GetConversationsImpl(
      stateStatus: null == stateStatus
          ? _value.stateStatus
          : stateStatus // ignore: cast_nullable_to_non_nullable
              as StateStatus,
      getConversations: null == getConversations
          ? _value.getConversations
          : getConversations // ignore: cast_nullable_to_non_nullable
              as GetConversationsDto,
    ));
  }

  /// Create a copy of ChatsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GetConversationsDtoCopyWith<$Res> get getConversations {
    return $GetConversationsDtoCopyWith<$Res>(_value.getConversations, (value) {
      return _then(_value.copyWith(getConversations: value));
    });
  }
}

/// @nodoc

class _$GetConversationsImpl implements _GetConversations {
  const _$GetConversationsImpl(
      {required this.stateStatus, required this.getConversations});

  @override
  final StateStatus stateStatus;
  @override
  final GetConversationsDto getConversations;

  @override
  String toString() {
    return 'ChatsEvent.getConversations(stateStatus: $stateStatus, getConversations: $getConversations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetConversationsImpl &&
            (identical(other.stateStatus, stateStatus) ||
                other.stateStatus == stateStatus) &&
            (identical(other.getConversations, getConversations) ||
                other.getConversations == getConversations));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stateStatus, getConversations);

  /// Create a copy of ChatsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetConversationsImplCopyWith<_$GetConversationsImpl> get copyWith =>
      __$$GetConversationsImplCopyWithImpl<_$GetConversationsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connectChatStream,
    required TResult Function() disposeChatStream,
    required TResult Function(StateStatus stateStatus, int page)
        getConversation,
    required TResult Function(
            StateStatus stateStatus, GetConversationsDto getConversations)
        getConversations,
    required TResult Function() disposeChatData,
    required TResult Function(String recipient, String content) sendChat,
    required TResult Function(StateStatus stateStatus, String? errorMessage)
        changeStateStatus,
  }) {
    return getConversations(stateStatus, this.getConversations);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? connectChatStream,
    TResult? Function()? disposeChatStream,
    TResult? Function(StateStatus stateStatus, int page)? getConversation,
    TResult? Function(
            StateStatus stateStatus, GetConversationsDto getConversations)?
        getConversations,
    TResult? Function()? disposeChatData,
    TResult? Function(String recipient, String content)? sendChat,
    TResult? Function(StateStatus stateStatus, String? errorMessage)?
        changeStateStatus,
  }) {
    return getConversations?.call(stateStatus, this.getConversations);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connectChatStream,
    TResult Function()? disposeChatStream,
    TResult Function(StateStatus stateStatus, int page)? getConversation,
    TResult Function(
            StateStatus stateStatus, GetConversationsDto getConversations)?
        getConversations,
    TResult Function()? disposeChatData,
    TResult Function(String recipient, String content)? sendChat,
    TResult Function(StateStatus stateStatus, String? errorMessage)?
        changeStateStatus,
    required TResult orElse(),
  }) {
    if (getConversations != null) {
      return getConversations(stateStatus, this.getConversations);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ConnectChatStream value) connectChatStream,
    required TResult Function(_DisposeChatStream value) disposeChatStream,
    required TResult Function(_GetConversation value) getConversation,
    required TResult Function(_GetConversations value) getConversations,
    required TResult Function(_DisposeChatData value) disposeChatData,
    required TResult Function(_SendChat value) sendChat,
    required TResult Function(_ChangeStateStatus value) changeStateStatus,
  }) {
    return getConversations(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ConnectChatStream value)? connectChatStream,
    TResult? Function(_DisposeChatStream value)? disposeChatStream,
    TResult? Function(_GetConversation value)? getConversation,
    TResult? Function(_GetConversations value)? getConversations,
    TResult? Function(_DisposeChatData value)? disposeChatData,
    TResult? Function(_SendChat value)? sendChat,
    TResult? Function(_ChangeStateStatus value)? changeStateStatus,
  }) {
    return getConversations?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ConnectChatStream value)? connectChatStream,
    TResult Function(_DisposeChatStream value)? disposeChatStream,
    TResult Function(_GetConversation value)? getConversation,
    TResult Function(_GetConversations value)? getConversations,
    TResult Function(_DisposeChatData value)? disposeChatData,
    TResult Function(_SendChat value)? sendChat,
    TResult Function(_ChangeStateStatus value)? changeStateStatus,
    required TResult orElse(),
  }) {
    if (getConversations != null) {
      return getConversations(this);
    }
    return orElse();
  }
}

abstract class _GetConversations implements ChatsEvent {
  const factory _GetConversations(
          {required final StateStatus stateStatus,
          required final GetConversationsDto getConversations}) =
      _$GetConversationsImpl;

  StateStatus get stateStatus;
  GetConversationsDto get getConversations;

  /// Create a copy of ChatsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetConversationsImplCopyWith<_$GetConversationsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DisposeChatDataImplCopyWith<$Res> {
  factory _$$DisposeChatDataImplCopyWith(_$DisposeChatDataImpl value,
          $Res Function(_$DisposeChatDataImpl) then) =
      __$$DisposeChatDataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DisposeChatDataImplCopyWithImpl<$Res>
    extends _$ChatsEventCopyWithImpl<$Res, _$DisposeChatDataImpl>
    implements _$$DisposeChatDataImplCopyWith<$Res> {
  __$$DisposeChatDataImplCopyWithImpl(
      _$DisposeChatDataImpl _value, $Res Function(_$DisposeChatDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DisposeChatDataImpl implements _DisposeChatData {
  const _$DisposeChatDataImpl();

  @override
  String toString() {
    return 'ChatsEvent.disposeChatData()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DisposeChatDataImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connectChatStream,
    required TResult Function() disposeChatStream,
    required TResult Function(StateStatus stateStatus, int page)
        getConversation,
    required TResult Function(
            StateStatus stateStatus, GetConversationsDto getConversations)
        getConversations,
    required TResult Function() disposeChatData,
    required TResult Function(String recipient, String content) sendChat,
    required TResult Function(StateStatus stateStatus, String? errorMessage)
        changeStateStatus,
  }) {
    return disposeChatData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? connectChatStream,
    TResult? Function()? disposeChatStream,
    TResult? Function(StateStatus stateStatus, int page)? getConversation,
    TResult? Function(
            StateStatus stateStatus, GetConversationsDto getConversations)?
        getConversations,
    TResult? Function()? disposeChatData,
    TResult? Function(String recipient, String content)? sendChat,
    TResult? Function(StateStatus stateStatus, String? errorMessage)?
        changeStateStatus,
  }) {
    return disposeChatData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connectChatStream,
    TResult Function()? disposeChatStream,
    TResult Function(StateStatus stateStatus, int page)? getConversation,
    TResult Function(
            StateStatus stateStatus, GetConversationsDto getConversations)?
        getConversations,
    TResult Function()? disposeChatData,
    TResult Function(String recipient, String content)? sendChat,
    TResult Function(StateStatus stateStatus, String? errorMessage)?
        changeStateStatus,
    required TResult orElse(),
  }) {
    if (disposeChatData != null) {
      return disposeChatData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ConnectChatStream value) connectChatStream,
    required TResult Function(_DisposeChatStream value) disposeChatStream,
    required TResult Function(_GetConversation value) getConversation,
    required TResult Function(_GetConversations value) getConversations,
    required TResult Function(_DisposeChatData value) disposeChatData,
    required TResult Function(_SendChat value) sendChat,
    required TResult Function(_ChangeStateStatus value) changeStateStatus,
  }) {
    return disposeChatData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ConnectChatStream value)? connectChatStream,
    TResult? Function(_DisposeChatStream value)? disposeChatStream,
    TResult? Function(_GetConversation value)? getConversation,
    TResult? Function(_GetConversations value)? getConversations,
    TResult? Function(_DisposeChatData value)? disposeChatData,
    TResult? Function(_SendChat value)? sendChat,
    TResult? Function(_ChangeStateStatus value)? changeStateStatus,
  }) {
    return disposeChatData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ConnectChatStream value)? connectChatStream,
    TResult Function(_DisposeChatStream value)? disposeChatStream,
    TResult Function(_GetConversation value)? getConversation,
    TResult Function(_GetConversations value)? getConversations,
    TResult Function(_DisposeChatData value)? disposeChatData,
    TResult Function(_SendChat value)? sendChat,
    TResult Function(_ChangeStateStatus value)? changeStateStatus,
    required TResult orElse(),
  }) {
    if (disposeChatData != null) {
      return disposeChatData(this);
    }
    return orElse();
  }
}

abstract class _DisposeChatData implements ChatsEvent {
  const factory _DisposeChatData() = _$DisposeChatDataImpl;
}

/// @nodoc
abstract class _$$SendChatImplCopyWith<$Res> {
  factory _$$SendChatImplCopyWith(
          _$SendChatImpl value, $Res Function(_$SendChatImpl) then) =
      __$$SendChatImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String recipient, String content});
}

/// @nodoc
class __$$SendChatImplCopyWithImpl<$Res>
    extends _$ChatsEventCopyWithImpl<$Res, _$SendChatImpl>
    implements _$$SendChatImplCopyWith<$Res> {
  __$$SendChatImplCopyWithImpl(
      _$SendChatImpl _value, $Res Function(_$SendChatImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipient = null,
    Object? content = null,
  }) {
    return _then(_$SendChatImpl(
      recipient: null == recipient
          ? _value.recipient
          : recipient // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SendChatImpl implements _SendChat {
  const _$SendChatImpl({required this.recipient, required this.content});

  @override
  final String recipient;
  @override
  final String content;

  @override
  String toString() {
    return 'ChatsEvent.sendChat(recipient: $recipient, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendChatImpl &&
            (identical(other.recipient, recipient) ||
                other.recipient == recipient) &&
            (identical(other.content, content) || other.content == content));
  }

  @override
  int get hashCode => Object.hash(runtimeType, recipient, content);

  /// Create a copy of ChatsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendChatImplCopyWith<_$SendChatImpl> get copyWith =>
      __$$SendChatImplCopyWithImpl<_$SendChatImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connectChatStream,
    required TResult Function() disposeChatStream,
    required TResult Function(StateStatus stateStatus, int page)
        getConversation,
    required TResult Function(
            StateStatus stateStatus, GetConversationsDto getConversations)
        getConversations,
    required TResult Function() disposeChatData,
    required TResult Function(String recipient, String content) sendChat,
    required TResult Function(StateStatus stateStatus, String? errorMessage)
        changeStateStatus,
  }) {
    return sendChat(recipient, content);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? connectChatStream,
    TResult? Function()? disposeChatStream,
    TResult? Function(StateStatus stateStatus, int page)? getConversation,
    TResult? Function(
            StateStatus stateStatus, GetConversationsDto getConversations)?
        getConversations,
    TResult? Function()? disposeChatData,
    TResult? Function(String recipient, String content)? sendChat,
    TResult? Function(StateStatus stateStatus, String? errorMessage)?
        changeStateStatus,
  }) {
    return sendChat?.call(recipient, content);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connectChatStream,
    TResult Function()? disposeChatStream,
    TResult Function(StateStatus stateStatus, int page)? getConversation,
    TResult Function(
            StateStatus stateStatus, GetConversationsDto getConversations)?
        getConversations,
    TResult Function()? disposeChatData,
    TResult Function(String recipient, String content)? sendChat,
    TResult Function(StateStatus stateStatus, String? errorMessage)?
        changeStateStatus,
    required TResult orElse(),
  }) {
    if (sendChat != null) {
      return sendChat(recipient, content);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ConnectChatStream value) connectChatStream,
    required TResult Function(_DisposeChatStream value) disposeChatStream,
    required TResult Function(_GetConversation value) getConversation,
    required TResult Function(_GetConversations value) getConversations,
    required TResult Function(_DisposeChatData value) disposeChatData,
    required TResult Function(_SendChat value) sendChat,
    required TResult Function(_ChangeStateStatus value) changeStateStatus,
  }) {
    return sendChat(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ConnectChatStream value)? connectChatStream,
    TResult? Function(_DisposeChatStream value)? disposeChatStream,
    TResult? Function(_GetConversation value)? getConversation,
    TResult? Function(_GetConversations value)? getConversations,
    TResult? Function(_DisposeChatData value)? disposeChatData,
    TResult? Function(_SendChat value)? sendChat,
    TResult? Function(_ChangeStateStatus value)? changeStateStatus,
  }) {
    return sendChat?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ConnectChatStream value)? connectChatStream,
    TResult Function(_DisposeChatStream value)? disposeChatStream,
    TResult Function(_GetConversation value)? getConversation,
    TResult Function(_GetConversations value)? getConversations,
    TResult Function(_DisposeChatData value)? disposeChatData,
    TResult Function(_SendChat value)? sendChat,
    TResult Function(_ChangeStateStatus value)? changeStateStatus,
    required TResult orElse(),
  }) {
    if (sendChat != null) {
      return sendChat(this);
    }
    return orElse();
  }
}

abstract class _SendChat implements ChatsEvent {
  const factory _SendChat(
      {required final String recipient,
      required final String content}) = _$SendChatImpl;

  String get recipient;
  String get content;

  /// Create a copy of ChatsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendChatImplCopyWith<_$SendChatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeStateStatusImplCopyWith<$Res> {
  factory _$$ChangeStateStatusImplCopyWith(_$ChangeStateStatusImpl value,
          $Res Function(_$ChangeStateStatusImpl) then) =
      __$$ChangeStateStatusImplCopyWithImpl<$Res>;
  @useResult
  $Res call({StateStatus stateStatus, String? errorMessage});
}

/// @nodoc
class __$$ChangeStateStatusImplCopyWithImpl<$Res>
    extends _$ChatsEventCopyWithImpl<$Res, _$ChangeStateStatusImpl>
    implements _$$ChangeStateStatusImplCopyWith<$Res> {
  __$$ChangeStateStatusImplCopyWithImpl(_$ChangeStateStatusImpl _value,
      $Res Function(_$ChangeStateStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stateStatus = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$ChangeStateStatusImpl(
      stateStatus: null == stateStatus
          ? _value.stateStatus
          : stateStatus // ignore: cast_nullable_to_non_nullable
              as StateStatus,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ChangeStateStatusImpl implements _ChangeStateStatus {
  const _$ChangeStateStatusImpl({required this.stateStatus, this.errorMessage});

  @override
  final StateStatus stateStatus;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'ChatsEvent.changeStateStatus(stateStatus: $stateStatus, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeStateStatusImpl &&
            (identical(other.stateStatus, stateStatus) ||
                other.stateStatus == stateStatus) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stateStatus, errorMessage);

  /// Create a copy of ChatsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeStateStatusImplCopyWith<_$ChangeStateStatusImpl> get copyWith =>
      __$$ChangeStateStatusImplCopyWithImpl<_$ChangeStateStatusImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connectChatStream,
    required TResult Function() disposeChatStream,
    required TResult Function(StateStatus stateStatus, int page)
        getConversation,
    required TResult Function(
            StateStatus stateStatus, GetConversationsDto getConversations)
        getConversations,
    required TResult Function() disposeChatData,
    required TResult Function(String recipient, String content) sendChat,
    required TResult Function(StateStatus stateStatus, String? errorMessage)
        changeStateStatus,
  }) {
    return changeStateStatus(stateStatus, errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? connectChatStream,
    TResult? Function()? disposeChatStream,
    TResult? Function(StateStatus stateStatus, int page)? getConversation,
    TResult? Function(
            StateStatus stateStatus, GetConversationsDto getConversations)?
        getConversations,
    TResult? Function()? disposeChatData,
    TResult? Function(String recipient, String content)? sendChat,
    TResult? Function(StateStatus stateStatus, String? errorMessage)?
        changeStateStatus,
  }) {
    return changeStateStatus?.call(stateStatus, errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connectChatStream,
    TResult Function()? disposeChatStream,
    TResult Function(StateStatus stateStatus, int page)? getConversation,
    TResult Function(
            StateStatus stateStatus, GetConversationsDto getConversations)?
        getConversations,
    TResult Function()? disposeChatData,
    TResult Function(String recipient, String content)? sendChat,
    TResult Function(StateStatus stateStatus, String? errorMessage)?
        changeStateStatus,
    required TResult orElse(),
  }) {
    if (changeStateStatus != null) {
      return changeStateStatus(stateStatus, errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ConnectChatStream value) connectChatStream,
    required TResult Function(_DisposeChatStream value) disposeChatStream,
    required TResult Function(_GetConversation value) getConversation,
    required TResult Function(_GetConversations value) getConversations,
    required TResult Function(_DisposeChatData value) disposeChatData,
    required TResult Function(_SendChat value) sendChat,
    required TResult Function(_ChangeStateStatus value) changeStateStatus,
  }) {
    return changeStateStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ConnectChatStream value)? connectChatStream,
    TResult? Function(_DisposeChatStream value)? disposeChatStream,
    TResult? Function(_GetConversation value)? getConversation,
    TResult? Function(_GetConversations value)? getConversations,
    TResult? Function(_DisposeChatData value)? disposeChatData,
    TResult? Function(_SendChat value)? sendChat,
    TResult? Function(_ChangeStateStatus value)? changeStateStatus,
  }) {
    return changeStateStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ConnectChatStream value)? connectChatStream,
    TResult Function(_DisposeChatStream value)? disposeChatStream,
    TResult Function(_GetConversation value)? getConversation,
    TResult Function(_GetConversations value)? getConversations,
    TResult Function(_DisposeChatData value)? disposeChatData,
    TResult Function(_SendChat value)? sendChat,
    TResult Function(_ChangeStateStatus value)? changeStateStatus,
    required TResult orElse(),
  }) {
    if (changeStateStatus != null) {
      return changeStateStatus(this);
    }
    return orElse();
  }
}

abstract class _ChangeStateStatus implements ChatsEvent {
  const factory _ChangeStateStatus(
      {required final StateStatus stateStatus,
      final String? errorMessage}) = _$ChangeStateStatusImpl;

  StateStatus get stateStatus;
  String? get errorMessage;

  /// Create a copy of ChatsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangeStateStatusImplCopyWith<_$ChangeStateStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ChatsState {
  String? get errorMessage => throw _privateConstructorUsedError;
  StateStatus get stateStatus => throw _privateConstructorUsedError;
  StateStatus get chatStatus => throw _privateConstructorUsedError;
  ConversationDataDto? get conversation => throw _privateConstructorUsedError;
  List<ConversationDto> get conversationList =>
      throw _privateConstructorUsedError;
  ConversationsDataDto? get conversations => throw _privateConstructorUsedError;
  List<ConversationsDto> get conversationsList =>
      throw _privateConstructorUsedError;
  String? get selectedConversationId => throw _privateConstructorUsedError;
  bool get isCurrentlyOnChatPage => throw _privateConstructorUsedError;
  bool get isChatUpdated => throw _privateConstructorUsedError;
  bool get isChatSent => throw _privateConstructorUsedError;
  bool get isConversationLoaded => throw _privateConstructorUsedError;
  bool get isConversationsLoaded => throw _privateConstructorUsedError;

  /// Create a copy of ChatsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatsStateCopyWith<ChatsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatsStateCopyWith<$Res> {
  factory $ChatsStateCopyWith(
          ChatsState value, $Res Function(ChatsState) then) =
      _$ChatsStateCopyWithImpl<$Res, ChatsState>;
  @useResult
  $Res call(
      {String? errorMessage,
      StateStatus stateStatus,
      StateStatus chatStatus,
      ConversationDataDto? conversation,
      List<ConversationDto> conversationList,
      ConversationsDataDto? conversations,
      List<ConversationsDto> conversationsList,
      String? selectedConversationId,
      bool isCurrentlyOnChatPage,
      bool isChatUpdated,
      bool isChatSent,
      bool isConversationLoaded,
      bool isConversationsLoaded});

  $ConversationDataDtoCopyWith<$Res>? get conversation;
  $ConversationsDataDtoCopyWith<$Res>? get conversations;
}

/// @nodoc
class _$ChatsStateCopyWithImpl<$Res, $Val extends ChatsState>
    implements $ChatsStateCopyWith<$Res> {
  _$ChatsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
    Object? stateStatus = null,
    Object? chatStatus = null,
    Object? conversation = freezed,
    Object? conversationList = null,
    Object? conversations = freezed,
    Object? conversationsList = null,
    Object? selectedConversationId = freezed,
    Object? isCurrentlyOnChatPage = null,
    Object? isChatUpdated = null,
    Object? isChatSent = null,
    Object? isConversationLoaded = null,
    Object? isConversationsLoaded = null,
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
      chatStatus: null == chatStatus
          ? _value.chatStatus
          : chatStatus // ignore: cast_nullable_to_non_nullable
              as StateStatus,
      conversation: freezed == conversation
          ? _value.conversation
          : conversation // ignore: cast_nullable_to_non_nullable
              as ConversationDataDto?,
      conversationList: null == conversationList
          ? _value.conversationList
          : conversationList // ignore: cast_nullable_to_non_nullable
              as List<ConversationDto>,
      conversations: freezed == conversations
          ? _value.conversations
          : conversations // ignore: cast_nullable_to_non_nullable
              as ConversationsDataDto?,
      conversationsList: null == conversationsList
          ? _value.conversationsList
          : conversationsList // ignore: cast_nullable_to_non_nullable
              as List<ConversationsDto>,
      selectedConversationId: freezed == selectedConversationId
          ? _value.selectedConversationId
          : selectedConversationId // ignore: cast_nullable_to_non_nullable
              as String?,
      isCurrentlyOnChatPage: null == isCurrentlyOnChatPage
          ? _value.isCurrentlyOnChatPage
          : isCurrentlyOnChatPage // ignore: cast_nullable_to_non_nullable
              as bool,
      isChatUpdated: null == isChatUpdated
          ? _value.isChatUpdated
          : isChatUpdated // ignore: cast_nullable_to_non_nullable
              as bool,
      isChatSent: null == isChatSent
          ? _value.isChatSent
          : isChatSent // ignore: cast_nullable_to_non_nullable
              as bool,
      isConversationLoaded: null == isConversationLoaded
          ? _value.isConversationLoaded
          : isConversationLoaded // ignore: cast_nullable_to_non_nullable
              as bool,
      isConversationsLoaded: null == isConversationsLoaded
          ? _value.isConversationsLoaded
          : isConversationsLoaded // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of ChatsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ConversationDataDtoCopyWith<$Res>? get conversation {
    if (_value.conversation == null) {
      return null;
    }

    return $ConversationDataDtoCopyWith<$Res>(_value.conversation!, (value) {
      return _then(_value.copyWith(conversation: value) as $Val);
    });
  }

  /// Create a copy of ChatsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ConversationsDataDtoCopyWith<$Res>? get conversations {
    if (_value.conversations == null) {
      return null;
    }

    return $ConversationsDataDtoCopyWith<$Res>(_value.conversations!, (value) {
      return _then(_value.copyWith(conversations: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChatsStateImplCopyWith<$Res>
    implements $ChatsStateCopyWith<$Res> {
  factory _$$ChatsStateImplCopyWith(
          _$ChatsStateImpl value, $Res Function(_$ChatsStateImpl) then) =
      __$$ChatsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? errorMessage,
      StateStatus stateStatus,
      StateStatus chatStatus,
      ConversationDataDto? conversation,
      List<ConversationDto> conversationList,
      ConversationsDataDto? conversations,
      List<ConversationsDto> conversationsList,
      String? selectedConversationId,
      bool isCurrentlyOnChatPage,
      bool isChatUpdated,
      bool isChatSent,
      bool isConversationLoaded,
      bool isConversationsLoaded});

  @override
  $ConversationDataDtoCopyWith<$Res>? get conversation;
  @override
  $ConversationsDataDtoCopyWith<$Res>? get conversations;
}

/// @nodoc
class __$$ChatsStateImplCopyWithImpl<$Res>
    extends _$ChatsStateCopyWithImpl<$Res, _$ChatsStateImpl>
    implements _$$ChatsStateImplCopyWith<$Res> {
  __$$ChatsStateImplCopyWithImpl(
      _$ChatsStateImpl _value, $Res Function(_$ChatsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
    Object? stateStatus = null,
    Object? chatStatus = null,
    Object? conversation = freezed,
    Object? conversationList = null,
    Object? conversations = freezed,
    Object? conversationsList = null,
    Object? selectedConversationId = freezed,
    Object? isCurrentlyOnChatPage = null,
    Object? isChatUpdated = null,
    Object? isChatSent = null,
    Object? isConversationLoaded = null,
    Object? isConversationsLoaded = null,
  }) {
    return _then(_$ChatsStateImpl(
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      stateStatus: null == stateStatus
          ? _value.stateStatus
          : stateStatus // ignore: cast_nullable_to_non_nullable
              as StateStatus,
      chatStatus: null == chatStatus
          ? _value.chatStatus
          : chatStatus // ignore: cast_nullable_to_non_nullable
              as StateStatus,
      conversation: freezed == conversation
          ? _value.conversation
          : conversation // ignore: cast_nullable_to_non_nullable
              as ConversationDataDto?,
      conversationList: null == conversationList
          ? _value._conversationList
          : conversationList // ignore: cast_nullable_to_non_nullable
              as List<ConversationDto>,
      conversations: freezed == conversations
          ? _value.conversations
          : conversations // ignore: cast_nullable_to_non_nullable
              as ConversationsDataDto?,
      conversationsList: null == conversationsList
          ? _value._conversationsList
          : conversationsList // ignore: cast_nullable_to_non_nullable
              as List<ConversationsDto>,
      selectedConversationId: freezed == selectedConversationId
          ? _value.selectedConversationId
          : selectedConversationId // ignore: cast_nullable_to_non_nullable
              as String?,
      isCurrentlyOnChatPage: null == isCurrentlyOnChatPage
          ? _value.isCurrentlyOnChatPage
          : isCurrentlyOnChatPage // ignore: cast_nullable_to_non_nullable
              as bool,
      isChatUpdated: null == isChatUpdated
          ? _value.isChatUpdated
          : isChatUpdated // ignore: cast_nullable_to_non_nullable
              as bool,
      isChatSent: null == isChatSent
          ? _value.isChatSent
          : isChatSent // ignore: cast_nullable_to_non_nullable
              as bool,
      isConversationLoaded: null == isConversationLoaded
          ? _value.isConversationLoaded
          : isConversationLoaded // ignore: cast_nullable_to_non_nullable
              as bool,
      isConversationsLoaded: null == isConversationsLoaded
          ? _value.isConversationsLoaded
          : isConversationsLoaded // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ChatsStateImpl implements _ChatsState {
  const _$ChatsStateImpl(
      {this.errorMessage,
      required this.stateStatus,
      required this.chatStatus,
      this.conversation,
      required final List<ConversationDto> conversationList,
      this.conversations,
      required final List<ConversationsDto> conversationsList,
      this.selectedConversationId,
      required this.isCurrentlyOnChatPage,
      required this.isChatUpdated,
      required this.isChatSent,
      required this.isConversationLoaded,
      required this.isConversationsLoaded})
      : _conversationList = conversationList,
        _conversationsList = conversationsList;

  @override
  final String? errorMessage;
  @override
  final StateStatus stateStatus;
  @override
  final StateStatus chatStatus;
  @override
  final ConversationDataDto? conversation;
  final List<ConversationDto> _conversationList;
  @override
  List<ConversationDto> get conversationList {
    if (_conversationList is EqualUnmodifiableListView)
      return _conversationList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_conversationList);
  }

  @override
  final ConversationsDataDto? conversations;
  final List<ConversationsDto> _conversationsList;
  @override
  List<ConversationsDto> get conversationsList {
    if (_conversationsList is EqualUnmodifiableListView)
      return _conversationsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_conversationsList);
  }

  @override
  final String? selectedConversationId;
  @override
  final bool isCurrentlyOnChatPage;
  @override
  final bool isChatUpdated;
  @override
  final bool isChatSent;
  @override
  final bool isConversationLoaded;
  @override
  final bool isConversationsLoaded;

  @override
  String toString() {
    return 'ChatsState(errorMessage: $errorMessage, stateStatus: $stateStatus, chatStatus: $chatStatus, conversation: $conversation, conversationList: $conversationList, conversations: $conversations, conversationsList: $conversationsList, selectedConversationId: $selectedConversationId, isCurrentlyOnChatPage: $isCurrentlyOnChatPage, isChatUpdated: $isChatUpdated, isChatSent: $isChatSent, isConversationLoaded: $isConversationLoaded, isConversationsLoaded: $isConversationsLoaded)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatsStateImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.stateStatus, stateStatus) ||
                other.stateStatus == stateStatus) &&
            (identical(other.chatStatus, chatStatus) ||
                other.chatStatus == chatStatus) &&
            (identical(other.conversation, conversation) ||
                other.conversation == conversation) &&
            const DeepCollectionEquality()
                .equals(other._conversationList, _conversationList) &&
            (identical(other.conversations, conversations) ||
                other.conversations == conversations) &&
            const DeepCollectionEquality()
                .equals(other._conversationsList, _conversationsList) &&
            (identical(other.selectedConversationId, selectedConversationId) ||
                other.selectedConversationId == selectedConversationId) &&
            (identical(other.isCurrentlyOnChatPage, isCurrentlyOnChatPage) ||
                other.isCurrentlyOnChatPage == isCurrentlyOnChatPage) &&
            (identical(other.isChatUpdated, isChatUpdated) ||
                other.isChatUpdated == isChatUpdated) &&
            (identical(other.isChatSent, isChatSent) ||
                other.isChatSent == isChatSent) &&
            (identical(other.isConversationLoaded, isConversationLoaded) ||
                other.isConversationLoaded == isConversationLoaded) &&
            (identical(other.isConversationsLoaded, isConversationsLoaded) ||
                other.isConversationsLoaded == isConversationsLoaded));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      errorMessage,
      stateStatus,
      chatStatus,
      conversation,
      const DeepCollectionEquality().hash(_conversationList),
      conversations,
      const DeepCollectionEquality().hash(_conversationsList),
      selectedConversationId,
      isCurrentlyOnChatPage,
      isChatUpdated,
      isChatSent,
      isConversationLoaded,
      isConversationsLoaded);

  /// Create a copy of ChatsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatsStateImplCopyWith<_$ChatsStateImpl> get copyWith =>
      __$$ChatsStateImplCopyWithImpl<_$ChatsStateImpl>(this, _$identity);
}

abstract class _ChatsState implements ChatsState {
  const factory _ChatsState(
      {final String? errorMessage,
      required final StateStatus stateStatus,
      required final StateStatus chatStatus,
      final ConversationDataDto? conversation,
      required final List<ConversationDto> conversationList,
      final ConversationsDataDto? conversations,
      required final List<ConversationsDto> conversationsList,
      final String? selectedConversationId,
      required final bool isCurrentlyOnChatPage,
      required final bool isChatUpdated,
      required final bool isChatSent,
      required final bool isConversationLoaded,
      required final bool isConversationsLoaded}) = _$ChatsStateImpl;

  @override
  String? get errorMessage;
  @override
  StateStatus get stateStatus;
  @override
  StateStatus get chatStatus;
  @override
  ConversationDataDto? get conversation;
  @override
  List<ConversationDto> get conversationList;
  @override
  ConversationsDataDto? get conversations;
  @override
  List<ConversationsDto> get conversationsList;
  @override
  String? get selectedConversationId;
  @override
  bool get isCurrentlyOnChatPage;
  @override
  bool get isChatUpdated;
  @override
  bool get isChatSent;
  @override
  bool get isConversationLoaded;
  @override
  bool get isConversationsLoaded;

  /// Create a copy of ChatsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatsStateImplCopyWith<_$ChatsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
