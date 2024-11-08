// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ConversationsData.dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConversationsDataDto _$ConversationsDataDtoFromJson(Map<String, dynamic> json) {
  return _ConversationsDataDto.fromJson(json);
}

/// @nodoc
mixin _$ConversationsDataDto {
  int get currentPage => throw _privateConstructorUsedError;
  int get maxPage => throw _privateConstructorUsedError;
  List<ConversationsDto> get conversationsList =>
      throw _privateConstructorUsedError;

  /// Serializes this ConversationsDataDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConversationsDataDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConversationsDataDtoCopyWith<ConversationsDataDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversationsDataDtoCopyWith<$Res> {
  factory $ConversationsDataDtoCopyWith(ConversationsDataDto value,
          $Res Function(ConversationsDataDto) then) =
      _$ConversationsDataDtoCopyWithImpl<$Res, ConversationsDataDto>;
  @useResult
  $Res call(
      {int currentPage, int maxPage, List<ConversationsDto> conversationsList});
}

/// @nodoc
class _$ConversationsDataDtoCopyWithImpl<$Res,
        $Val extends ConversationsDataDto>
    implements $ConversationsDataDtoCopyWith<$Res> {
  _$ConversationsDataDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConversationsDataDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? maxPage = null,
    Object? conversationsList = null,
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
      conversationsList: null == conversationsList
          ? _value.conversationsList
          : conversationsList // ignore: cast_nullable_to_non_nullable
              as List<ConversationsDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConversationsDataDtoImplCopyWith<$Res>
    implements $ConversationsDataDtoCopyWith<$Res> {
  factory _$$ConversationsDataDtoImplCopyWith(_$ConversationsDataDtoImpl value,
          $Res Function(_$ConversationsDataDtoImpl) then) =
      __$$ConversationsDataDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int currentPage, int maxPage, List<ConversationsDto> conversationsList});
}

/// @nodoc
class __$$ConversationsDataDtoImplCopyWithImpl<$Res>
    extends _$ConversationsDataDtoCopyWithImpl<$Res, _$ConversationsDataDtoImpl>
    implements _$$ConversationsDataDtoImplCopyWith<$Res> {
  __$$ConversationsDataDtoImplCopyWithImpl(_$ConversationsDataDtoImpl _value,
      $Res Function(_$ConversationsDataDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConversationsDataDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? maxPage = null,
    Object? conversationsList = null,
  }) {
    return _then(_$ConversationsDataDtoImpl(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      maxPage: null == maxPage
          ? _value.maxPage
          : maxPage // ignore: cast_nullable_to_non_nullable
              as int,
      conversationsList: null == conversationsList
          ? _value._conversationsList
          : conversationsList // ignore: cast_nullable_to_non_nullable
              as List<ConversationsDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConversationsDataDtoImpl extends _ConversationsDataDto {
  const _$ConversationsDataDtoImpl(
      {required this.currentPage,
      required this.maxPage,
      required final List<ConversationsDto> conversationsList})
      : _conversationsList = conversationsList,
        super._();

  factory _$ConversationsDataDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConversationsDataDtoImplFromJson(json);

  @override
  final int currentPage;
  @override
  final int maxPage;
  final List<ConversationsDto> _conversationsList;
  @override
  List<ConversationsDto> get conversationsList {
    if (_conversationsList is EqualUnmodifiableListView)
      return _conversationsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_conversationsList);
  }

  @override
  String toString() {
    return 'ConversationsDataDto(currentPage: $currentPage, maxPage: $maxPage, conversationsList: $conversationsList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConversationsDataDtoImpl &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.maxPage, maxPage) || other.maxPage == maxPage) &&
            const DeepCollectionEquality()
                .equals(other._conversationsList, _conversationsList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, currentPage, maxPage,
      const DeepCollectionEquality().hash(_conversationsList));

  /// Create a copy of ConversationsDataDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConversationsDataDtoImplCopyWith<_$ConversationsDataDtoImpl>
      get copyWith =>
          __$$ConversationsDataDtoImplCopyWithImpl<_$ConversationsDataDtoImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConversationsDataDtoImplToJson(
      this,
    );
  }
}

abstract class _ConversationsDataDto extends ConversationsDataDto {
  const factory _ConversationsDataDto(
          {required final int currentPage,
          required final int maxPage,
          required final List<ConversationsDto> conversationsList}) =
      _$ConversationsDataDtoImpl;
  const _ConversationsDataDto._() : super._();

  factory _ConversationsDataDto.fromJson(Map<String, dynamic> json) =
      _$ConversationsDataDtoImpl.fromJson;

  @override
  int get currentPage;
  @override
  int get maxPage;
  @override
  List<ConversationsDto> get conversationsList;

  /// Create a copy of ConversationsDataDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConversationsDataDtoImplCopyWith<_$ConversationsDataDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
