// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ConversationData.dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConversationDataDto _$ConversationDataDtoFromJson(Map<String, dynamic> json) {
  return _ConversationDataDto.fromJson(json);
}

/// @nodoc
mixin _$ConversationDataDto {
  int get currentPage => throw _privateConstructorUsedError;
  int get maxPage => throw _privateConstructorUsedError;
  List<ConversationDto> get conversationList =>
      throw _privateConstructorUsedError;

  /// Serializes this ConversationDataDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConversationDataDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConversationDataDtoCopyWith<ConversationDataDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversationDataDtoCopyWith<$Res> {
  factory $ConversationDataDtoCopyWith(
          ConversationDataDto value, $Res Function(ConversationDataDto) then) =
      _$ConversationDataDtoCopyWithImpl<$Res, ConversationDataDto>;
  @useResult
  $Res call(
      {int currentPage, int maxPage, List<ConversationDto> conversationList});
}

/// @nodoc
class _$ConversationDataDtoCopyWithImpl<$Res, $Val extends ConversationDataDto>
    implements $ConversationDataDtoCopyWith<$Res> {
  _$ConversationDataDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConversationDataDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? maxPage = null,
    Object? conversationList = null,
  }) {
    return _then(_value.copyWith(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      maxPage: null == maxPage
          ? _value.maxPage
          : maxPage // ignore: cast_nullable_to_non_nullable
              as int,
      conversationList: null == conversationList
          ? _value.conversationList
          : conversationList // ignore: cast_nullable_to_non_nullable
              as List<ConversationDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConversationDataDtoImplCopyWith<$Res>
    implements $ConversationDataDtoCopyWith<$Res> {
  factory _$$ConversationDataDtoImplCopyWith(_$ConversationDataDtoImpl value,
          $Res Function(_$ConversationDataDtoImpl) then) =
      __$$ConversationDataDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int currentPage, int maxPage, List<ConversationDto> conversationList});
}

/// @nodoc
class __$$ConversationDataDtoImplCopyWithImpl<$Res>
    extends _$ConversationDataDtoCopyWithImpl<$Res, _$ConversationDataDtoImpl>
    implements _$$ConversationDataDtoImplCopyWith<$Res> {
  __$$ConversationDataDtoImplCopyWithImpl(_$ConversationDataDtoImpl _value,
      $Res Function(_$ConversationDataDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConversationDataDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? maxPage = null,
    Object? conversationList = null,
  }) {
    return _then(_$ConversationDataDtoImpl(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      maxPage: null == maxPage
          ? _value.maxPage
          : maxPage // ignore: cast_nullable_to_non_nullable
              as int,
      conversationList: null == conversationList
          ? _value._conversationList
          : conversationList // ignore: cast_nullable_to_non_nullable
              as List<ConversationDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConversationDataDtoImpl extends _ConversationDataDto {
  const _$ConversationDataDtoImpl(
      {required this.currentPage,
      required this.maxPage,
      required final List<ConversationDto> conversationList})
      : _conversationList = conversationList,
        super._();

  factory _$ConversationDataDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConversationDataDtoImplFromJson(json);

  @override
  final int currentPage;
  @override
  final int maxPage;
  final List<ConversationDto> _conversationList;
  @override
  List<ConversationDto> get conversationList {
    if (_conversationList is EqualUnmodifiableListView)
      return _conversationList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_conversationList);
  }

  @override
  String toString() {
    return 'ConversationDataDto(currentPage: $currentPage, maxPage: $maxPage, conversationList: $conversationList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConversationDataDtoImpl &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.maxPage, maxPage) || other.maxPage == maxPage) &&
            const DeepCollectionEquality()
                .equals(other._conversationList, _conversationList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, currentPage, maxPage,
      const DeepCollectionEquality().hash(_conversationList));

  /// Create a copy of ConversationDataDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConversationDataDtoImplCopyWith<_$ConversationDataDtoImpl> get copyWith =>
      __$$ConversationDataDtoImplCopyWithImpl<_$ConversationDataDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConversationDataDtoImplToJson(
      this,
    );
  }
}

abstract class _ConversationDataDto extends ConversationDataDto {
  const factory _ConversationDataDto(
          {required final int currentPage,
          required final int maxPage,
          required final List<ConversationDto> conversationList}) =
      _$ConversationDataDtoImpl;
  const _ConversationDataDto._() : super._();

  factory _ConversationDataDto.fromJson(Map<String, dynamic> json) =
      _$ConversationDataDtoImpl.fromJson;

  @override
  int get currentPage;
  @override
  int get maxPage;
  @override
  List<ConversationDto> get conversationList;

  /// Create a copy of ConversationDataDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConversationDataDtoImplCopyWith<_$ConversationDataDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
