// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'Conversation.dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConversationDto _$ConversationDtoFromJson(Map<String, dynamic> json) {
  return _ConversationDto.fromJson(json);
}

/// @nodoc
mixin _$ConversationDto {
  String get sender => throw _privateConstructorUsedError;
  String get recipient => throw _privateConstructorUsedError;
  String get lastMessage => throw _privateConstructorUsedError;
  String get timeStamp => throw _privateConstructorUsedError;
  String get conversationsId => throw _privateConstructorUsedError;

  /// Serializes this ConversationDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConversationDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConversationDtoCopyWith<ConversationDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversationDtoCopyWith<$Res> {
  factory $ConversationDtoCopyWith(
          ConversationDto value, $Res Function(ConversationDto) then) =
      _$ConversationDtoCopyWithImpl<$Res, ConversationDto>;
  @useResult
  $Res call(
      {String sender,
      String recipient,
      String lastMessage,
      String timeStamp,
      String conversationsId});
}

/// @nodoc
class _$ConversationDtoCopyWithImpl<$Res, $Val extends ConversationDto>
    implements $ConversationDtoCopyWith<$Res> {
  _$ConversationDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConversationDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sender = null,
    Object? recipient = null,
    Object? lastMessage = null,
    Object? timeStamp = null,
    Object? conversationsId = null,
  }) {
    return _then(_value.copyWith(
      sender: null == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as String,
      recipient: null == recipient
          ? _value.recipient
          : recipient // ignore: cast_nullable_to_non_nullable
              as String,
      lastMessage: null == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String,
      timeStamp: null == timeStamp
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as String,
      conversationsId: null == conversationsId
          ? _value.conversationsId
          : conversationsId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConversationDtoImplCopyWith<$Res>
    implements $ConversationDtoCopyWith<$Res> {
  factory _$$ConversationDtoImplCopyWith(_$ConversationDtoImpl value,
          $Res Function(_$ConversationDtoImpl) then) =
      __$$ConversationDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String sender,
      String recipient,
      String lastMessage,
      String timeStamp,
      String conversationsId});
}

/// @nodoc
class __$$ConversationDtoImplCopyWithImpl<$Res>
    extends _$ConversationDtoCopyWithImpl<$Res, _$ConversationDtoImpl>
    implements _$$ConversationDtoImplCopyWith<$Res> {
  __$$ConversationDtoImplCopyWithImpl(
      _$ConversationDtoImpl _value, $Res Function(_$ConversationDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConversationDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sender = null,
    Object? recipient = null,
    Object? lastMessage = null,
    Object? timeStamp = null,
    Object? conversationsId = null,
  }) {
    return _then(_$ConversationDtoImpl(
      sender: null == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as String,
      recipient: null == recipient
          ? _value.recipient
          : recipient // ignore: cast_nullable_to_non_nullable
              as String,
      lastMessage: null == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String,
      timeStamp: null == timeStamp
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as String,
      conversationsId: null == conversationsId
          ? _value.conversationsId
          : conversationsId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConversationDtoImpl extends _ConversationDto {
  const _$ConversationDtoImpl(
      {required this.sender,
      required this.recipient,
      required this.lastMessage,
      required this.timeStamp,
      required this.conversationsId})
      : super._();

  factory _$ConversationDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConversationDtoImplFromJson(json);

  @override
  final String sender;
  @override
  final String recipient;
  @override
  final String lastMessage;
  @override
  final String timeStamp;
  @override
  final String conversationsId;

  @override
  String toString() {
    return 'ConversationDto(sender: $sender, recipient: $recipient, lastMessage: $lastMessage, timeStamp: $timeStamp, conversationsId: $conversationsId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConversationDtoImpl &&
            (identical(other.sender, sender) || other.sender == sender) &&
            (identical(other.recipient, recipient) ||
                other.recipient == recipient) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage) &&
            (identical(other.timeStamp, timeStamp) ||
                other.timeStamp == timeStamp) &&
            (identical(other.conversationsId, conversationsId) ||
                other.conversationsId == conversationsId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, sender, recipient, lastMessage, timeStamp, conversationsId);

  /// Create a copy of ConversationDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConversationDtoImplCopyWith<_$ConversationDtoImpl> get copyWith =>
      __$$ConversationDtoImplCopyWithImpl<_$ConversationDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConversationDtoImplToJson(
      this,
    );
  }
}

abstract class _ConversationDto extends ConversationDto {
  const factory _ConversationDto(
      {required final String sender,
      required final String recipient,
      required final String lastMessage,
      required final String timeStamp,
      required final String conversationsId}) = _$ConversationDtoImpl;
  const _ConversationDto._() : super._();

  factory _ConversationDto.fromJson(Map<String, dynamic> json) =
      _$ConversationDtoImpl.fromJson;

  @override
  String get sender;
  @override
  String get recipient;
  @override
  String get lastMessage;
  @override
  String get timeStamp;
  @override
  String get conversationsId;

  /// Create a copy of ConversationDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConversationDtoImplCopyWith<_$ConversationDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
