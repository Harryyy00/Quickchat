// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'RegisterUser.dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RegisterUserDto {
  String get name => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  /// Create a copy of RegisterUserDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegisterUserDtoCopyWith<RegisterUserDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterUserDtoCopyWith<$Res> {
  factory $RegisterUserDtoCopyWith(
          RegisterUserDto value, $Res Function(RegisterUserDto) then) =
      _$RegisterUserDtoCopyWithImpl<$Res, RegisterUserDto>;
  @useResult
  $Res call({String name, String username, String password});
}

/// @nodoc
class _$RegisterUserDtoCopyWithImpl<$Res, $Val extends RegisterUserDto>
    implements $RegisterUserDtoCopyWith<$Res> {
  _$RegisterUserDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegisterUserDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? username = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegisterUserDtoImplCopyWith<$Res>
    implements $RegisterUserDtoCopyWith<$Res> {
  factory _$$RegisterUserDtoImplCopyWith(_$RegisterUserDtoImpl value,
          $Res Function(_$RegisterUserDtoImpl) then) =
      __$$RegisterUserDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String username, String password});
}

/// @nodoc
class __$$RegisterUserDtoImplCopyWithImpl<$Res>
    extends _$RegisterUserDtoCopyWithImpl<$Res, _$RegisterUserDtoImpl>
    implements _$$RegisterUserDtoImplCopyWith<$Res> {
  __$$RegisterUserDtoImplCopyWithImpl(
      _$RegisterUserDtoImpl _value, $Res Function(_$RegisterUserDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegisterUserDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? username = null,
    Object? password = null,
  }) {
    return _then(_$RegisterUserDtoImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RegisterUserDtoImpl extends _RegisterUserDto {
  const _$RegisterUserDtoImpl(
      {required this.name, required this.username, required this.password})
      : super._();

  @override
  final String name;
  @override
  final String username;
  @override
  final String password;

  @override
  String toString() {
    return 'RegisterUserDto(name: $name, username: $username, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterUserDtoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, username, password);

  /// Create a copy of RegisterUserDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterUserDtoImplCopyWith<_$RegisterUserDtoImpl> get copyWith =>
      __$$RegisterUserDtoImplCopyWithImpl<_$RegisterUserDtoImpl>(
          this, _$identity);
}

abstract class _RegisterUserDto extends RegisterUserDto {
  const factory _RegisterUserDto(
      {required final String name,
      required final String username,
      required final String password}) = _$RegisterUserDtoImpl;
  const _RegisterUserDto._() : super._();

  @override
  String get name;
  @override
  String get username;
  @override
  String get password;

  /// Create a copy of RegisterUserDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterUserDtoImplCopyWith<_$RegisterUserDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
