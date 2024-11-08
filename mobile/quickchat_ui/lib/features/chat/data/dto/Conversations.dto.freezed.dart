// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'Conversations.dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConversationsDto _$ConversationsDtoFromJson(Map<String, dynamic> json) {
  return _ConversationsDto.fromJson(json);
}

/// @nodoc
mixin _$ConversationsDto {
// required String id,
  String get sender => throw _privateConstructorUsedError;
  String get recipient => throw _privateConstructorUsedError;
  DateTime get sentAt => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;

  /// Serializes this ConversationsDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConversationsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConversationsDtoCopyWith<ConversationsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversationsDtoCopyWith<$Res> {
  factory $ConversationsDtoCopyWith(
          ConversationsDto value, $Res Function(ConversationsDto) then) =
      _$ConversationsDtoCopyWithImpl<$Res, ConversationsDto>;
  @useResult
  $Res call({String sender, String recipient, DateTime sentAt, String content});
}

/// @nodoc
class _$ConversationsDtoCopyWithImpl<$Res, $Val extends ConversationsDto>
    implements $ConversationsDtoCopyWith<$Res> {
  _$ConversationsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConversationsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sender = null,
    Object? recipient = null,
    Object? sentAt = null,
    Object? content = null,
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
      sentAt: null == sentAt
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConversationsDtoImplCopyWith<$Res>
    implements $ConversationsDtoCopyWith<$Res> {
  factory _$$ConversationsDtoImplCopyWith(_$ConversationsDtoImpl value,
          $Res Function(_$ConversationsDtoImpl) then) =
      __$$ConversationsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String sender, String recipient, DateTime sentAt, String content});
}

/// @nodoc
class __$$ConversationsDtoImplCopyWithImpl<$Res>
    extends _$ConversationsDtoCopyWithImpl<$Res, _$ConversationsDtoImpl>
    implements _$$ConversationsDtoImplCopyWith<$Res> {
  __$$ConversationsDtoImplCopyWithImpl(_$ConversationsDtoImpl _value,
      $Res Function(_$ConversationsDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConversationsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sender = null,
    Object? recipient = null,
    Object? sentAt = null,
    Object? content = null,
  }) {
    return _then(_$ConversationsDtoImpl(
      sender: null == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as String,
      recipient: null == recipient
          ? _value.recipient
          : recipient // ignore: cast_nullable_to_non_nullable
              as String,
      sentAt: null == sentAt
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConversationsDtoImpl extends _ConversationsDto {
  const _$ConversationsDtoImpl(
      {required this.sender,
      required this.recipient,
      required this.sentAt,
      required this.content})
      : super._();

  factory _$ConversationsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConversationsDtoImplFromJson(json);

// required String id,
  @override
  final String sender;
  @override
  final String recipient;
  @override
  final DateTime sentAt;
  @override
  final String content;

  @override
  String toString() {
    return 'ConversationsDto(sender: $sender, recipient: $recipient, sentAt: $sentAt, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConversationsDtoImpl &&
            (identical(other.sender, sender) || other.sender == sender) &&
            (identical(other.recipient, recipient) ||
                other.recipient == recipient) &&
            (identical(other.sentAt, sentAt) || other.sentAt == sentAt) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, sender, recipient, sentAt, content);

  /// Create a copy of ConversationsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConversationsDtoImplCopyWith<_$ConversationsDtoImpl> get copyWith =>
      __$$ConversationsDtoImplCopyWithImpl<_$ConversationsDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConversationsDtoImplToJson(
      this,
    );
  }
}

abstract class _ConversationsDto extends ConversationsDto {
  const factory _ConversationsDto(
      {required final String sender,
      required final String recipient,
      required final DateTime sentAt,
      required final String content}) = _$ConversationsDtoImpl;
  const _ConversationsDto._() : super._();

  factory _ConversationsDto.fromJson(Map<String, dynamic> json) =
      _$ConversationsDtoImpl.fromJson;

// required String id,
  @override
  String get sender;
  @override
  String get recipient;
  @override
  DateTime get sentAt;
  @override
  String get content;

  /// Create a copy of ConversationsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConversationsDtoImplCopyWith<_$ConversationsDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
