// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'GetConversations.dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetConversationsDto {
  String get conversationsId => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;

  /// Create a copy of GetConversationsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetConversationsDtoCopyWith<GetConversationsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetConversationsDtoCopyWith<$Res> {
  factory $GetConversationsDtoCopyWith(
          GetConversationsDto value, $Res Function(GetConversationsDto) then) =
      _$GetConversationsDtoCopyWithImpl<$Res, GetConversationsDto>;
  @useResult
  $Res call({String conversationsId, int page});
}

/// @nodoc
class _$GetConversationsDtoCopyWithImpl<$Res, $Val extends GetConversationsDto>
    implements $GetConversationsDtoCopyWith<$Res> {
  _$GetConversationsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetConversationsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conversationsId = null,
    Object? page = null,
  }) {
    return _then(_value.copyWith(
      conversationsId: null == conversationsId
          ? _value.conversationsId
          : conversationsId // ignore: cast_nullable_to_non_nullable
              as String,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetConversationsDtoImplCopyWith<$Res>
    implements $GetConversationsDtoCopyWith<$Res> {
  factory _$$GetConversationsDtoImplCopyWith(_$GetConversationsDtoImpl value,
          $Res Function(_$GetConversationsDtoImpl) then) =
      __$$GetConversationsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String conversationsId, int page});
}

/// @nodoc
class __$$GetConversationsDtoImplCopyWithImpl<$Res>
    extends _$GetConversationsDtoCopyWithImpl<$Res, _$GetConversationsDtoImpl>
    implements _$$GetConversationsDtoImplCopyWith<$Res> {
  __$$GetConversationsDtoImplCopyWithImpl(_$GetConversationsDtoImpl _value,
      $Res Function(_$GetConversationsDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetConversationsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conversationsId = null,
    Object? page = null,
  }) {
    return _then(_$GetConversationsDtoImpl(
      conversationsId: null == conversationsId
          ? _value.conversationsId
          : conversationsId // ignore: cast_nullable_to_non_nullable
              as String,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GetConversationsDtoImpl extends _GetConversationsDto {
  const _$GetConversationsDtoImpl(
      {required this.conversationsId, required this.page})
      : super._();

  @override
  final String conversationsId;
  @override
  final int page;

  @override
  String toString() {
    return 'GetConversationsDto(conversationsId: $conversationsId, page: $page)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetConversationsDtoImpl &&
            (identical(other.conversationsId, conversationsId) ||
                other.conversationsId == conversationsId) &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType, conversationsId, page);

  /// Create a copy of GetConversationsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetConversationsDtoImplCopyWith<_$GetConversationsDtoImpl> get copyWith =>
      __$$GetConversationsDtoImplCopyWithImpl<_$GetConversationsDtoImpl>(
          this, _$identity);
}

abstract class _GetConversationsDto extends GetConversationsDto {
  const factory _GetConversationsDto(
      {required final String conversationsId,
      required final int page}) = _$GetConversationsDtoImpl;
  const _GetConversationsDto._() : super._();

  @override
  String get conversationsId;
  @override
  int get page;

  /// Create a copy of GetConversationsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetConversationsDtoImplCopyWith<_$GetConversationsDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
