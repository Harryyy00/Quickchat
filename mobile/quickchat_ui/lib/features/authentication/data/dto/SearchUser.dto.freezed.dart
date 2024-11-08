// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'SearchUser.dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchUserDto {
  StateStatus get stateStatus => throw _privateConstructorUsedError;
  String get querySearch => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;

  /// Create a copy of SearchUserDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchUserDtoCopyWith<SearchUserDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchUserDtoCopyWith<$Res> {
  factory $SearchUserDtoCopyWith(
          SearchUserDto value, $Res Function(SearchUserDto) then) =
      _$SearchUserDtoCopyWithImpl<$Res, SearchUserDto>;
  @useResult
  $Res call({StateStatus stateStatus, String querySearch, int page});
}

/// @nodoc
class _$SearchUserDtoCopyWithImpl<$Res, $Val extends SearchUserDto>
    implements $SearchUserDtoCopyWith<$Res> {
  _$SearchUserDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchUserDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stateStatus = null,
    Object? querySearch = null,
    Object? page = null,
  }) {
    return _then(_value.copyWith(
      stateStatus: null == stateStatus
          ? _value.stateStatus
          : stateStatus // ignore: cast_nullable_to_non_nullable
              as StateStatus,
      querySearch: null == querySearch
          ? _value.querySearch
          : querySearch // ignore: cast_nullable_to_non_nullable
              as String,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchUserDtoImplCopyWith<$Res>
    implements $SearchUserDtoCopyWith<$Res> {
  factory _$$SearchUserDtoImplCopyWith(
          _$SearchUserDtoImpl value, $Res Function(_$SearchUserDtoImpl) then) =
      __$$SearchUserDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({StateStatus stateStatus, String querySearch, int page});
}

/// @nodoc
class __$$SearchUserDtoImplCopyWithImpl<$Res>
    extends _$SearchUserDtoCopyWithImpl<$Res, _$SearchUserDtoImpl>
    implements _$$SearchUserDtoImplCopyWith<$Res> {
  __$$SearchUserDtoImplCopyWithImpl(
      _$SearchUserDtoImpl _value, $Res Function(_$SearchUserDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchUserDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stateStatus = null,
    Object? querySearch = null,
    Object? page = null,
  }) {
    return _then(_$SearchUserDtoImpl(
      stateStatus: null == stateStatus
          ? _value.stateStatus
          : stateStatus // ignore: cast_nullable_to_non_nullable
              as StateStatus,
      querySearch: null == querySearch
          ? _value.querySearch
          : querySearch // ignore: cast_nullable_to_non_nullable
              as String,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SearchUserDtoImpl extends _SearchUserDto {
  const _$SearchUserDtoImpl(
      {required this.stateStatus,
      required this.querySearch,
      required this.page})
      : super._();

  @override
  final StateStatus stateStatus;
  @override
  final String querySearch;
  @override
  final int page;

  @override
  String toString() {
    return 'SearchUserDto(stateStatus: $stateStatus, querySearch: $querySearch, page: $page)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchUserDtoImpl &&
            (identical(other.stateStatus, stateStatus) ||
                other.stateStatus == stateStatus) &&
            (identical(other.querySearch, querySearch) ||
                other.querySearch == querySearch) &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stateStatus, querySearch, page);

  /// Create a copy of SearchUserDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchUserDtoImplCopyWith<_$SearchUserDtoImpl> get copyWith =>
      __$$SearchUserDtoImplCopyWithImpl<_$SearchUserDtoImpl>(this, _$identity);
}

abstract class _SearchUserDto extends SearchUserDto {
  const factory _SearchUserDto(
      {required final StateStatus stateStatus,
      required final String querySearch,
      required final int page}) = _$SearchUserDtoImpl;
  const _SearchUserDto._() : super._();

  @override
  StateStatus get stateStatus;
  @override
  String get querySearch;
  @override
  int get page;

  /// Create a copy of SearchUserDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchUserDtoImplCopyWith<_$SearchUserDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
