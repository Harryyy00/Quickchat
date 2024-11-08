// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'SearchData.dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SearchDataDto _$SearchDataDtoFromJson(Map<String, dynamic> json) {
  return _SearchDataDto.fromJson(json);
}

/// @nodoc
mixin _$SearchDataDto {
  int get currentPage => throw _privateConstructorUsedError;
  int get maxPage => throw _privateConstructorUsedError;
  List<UserDataDto> get users => throw _privateConstructorUsedError;

  /// Serializes this SearchDataDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SearchDataDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchDataDtoCopyWith<SearchDataDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchDataDtoCopyWith<$Res> {
  factory $SearchDataDtoCopyWith(
          SearchDataDto value, $Res Function(SearchDataDto) then) =
      _$SearchDataDtoCopyWithImpl<$Res, SearchDataDto>;
  @useResult
  $Res call({int currentPage, int maxPage, List<UserDataDto> users});
}

/// @nodoc
class _$SearchDataDtoCopyWithImpl<$Res, $Val extends SearchDataDto>
    implements $SearchDataDtoCopyWith<$Res> {
  _$SearchDataDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchDataDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? maxPage = null,
    Object? users = null,
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
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserDataDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchDataDtoImplCopyWith<$Res>
    implements $SearchDataDtoCopyWith<$Res> {
  factory _$$SearchDataDtoImplCopyWith(
          _$SearchDataDtoImpl value, $Res Function(_$SearchDataDtoImpl) then) =
      __$$SearchDataDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int currentPage, int maxPage, List<UserDataDto> users});
}

/// @nodoc
class __$$SearchDataDtoImplCopyWithImpl<$Res>
    extends _$SearchDataDtoCopyWithImpl<$Res, _$SearchDataDtoImpl>
    implements _$$SearchDataDtoImplCopyWith<$Res> {
  __$$SearchDataDtoImplCopyWithImpl(
      _$SearchDataDtoImpl _value, $Res Function(_$SearchDataDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchDataDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? maxPage = null,
    Object? users = null,
  }) {
    return _then(_$SearchDataDtoImpl(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      maxPage: null == maxPage
          ? _value.maxPage
          : maxPage // ignore: cast_nullable_to_non_nullable
              as int,
      users: null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserDataDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchDataDtoImpl extends _SearchDataDto {
  const _$SearchDataDtoImpl(
      {required this.currentPage,
      required this.maxPage,
      required final List<UserDataDto> users})
      : _users = users,
        super._();

  factory _$SearchDataDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchDataDtoImplFromJson(json);

  @override
  final int currentPage;
  @override
  final int maxPage;
  final List<UserDataDto> _users;
  @override
  List<UserDataDto> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  @override
  String toString() {
    return 'SearchDataDto(currentPage: $currentPage, maxPage: $maxPage, users: $users)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchDataDtoImpl &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.maxPage, maxPage) || other.maxPage == maxPage) &&
            const DeepCollectionEquality().equals(other._users, _users));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, currentPage, maxPage,
      const DeepCollectionEquality().hash(_users));

  /// Create a copy of SearchDataDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchDataDtoImplCopyWith<_$SearchDataDtoImpl> get copyWith =>
      __$$SearchDataDtoImplCopyWithImpl<_$SearchDataDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchDataDtoImplToJson(
      this,
    );
  }
}

abstract class _SearchDataDto extends SearchDataDto {
  const factory _SearchDataDto(
      {required final int currentPage,
      required final int maxPage,
      required final List<UserDataDto> users}) = _$SearchDataDtoImpl;
  const _SearchDataDto._() : super._();

  factory _SearchDataDto.fromJson(Map<String, dynamic> json) =
      _$SearchDataDtoImpl.fromJson;

  @override
  int get currentPage;
  @override
  int get maxPage;
  @override
  List<UserDataDto> get users;

  /// Create a copy of SearchDataDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchDataDtoImplCopyWith<_$SearchDataDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
