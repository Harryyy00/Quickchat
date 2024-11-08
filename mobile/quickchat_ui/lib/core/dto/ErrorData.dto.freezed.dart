// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ErrorData.dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ErrorDataDto _$ErrorDataDtoFromJson(Map<String, dynamic> json) {
  return _ErrorDataDto.fromJson(json);
}

/// @nodoc
mixin _$ErrorDataDto {
  int get statusCode => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  /// Serializes this ErrorDataDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ErrorDataDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ErrorDataDtoCopyWith<ErrorDataDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorDataDtoCopyWith<$Res> {
  factory $ErrorDataDtoCopyWith(
          ErrorDataDto value, $Res Function(ErrorDataDto) then) =
      _$ErrorDataDtoCopyWithImpl<$Res, ErrorDataDto>;
  @useResult
  $Res call({int statusCode, String errorMessage});
}

/// @nodoc
class _$ErrorDataDtoCopyWithImpl<$Res, $Val extends ErrorDataDto>
    implements $ErrorDataDtoCopyWith<$Res> {
  _$ErrorDataDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ErrorDataDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? errorMessage = null,
  }) {
    return _then(_value.copyWith(
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ErrorDataDtoImplCopyWith<$Res>
    implements $ErrorDataDtoCopyWith<$Res> {
  factory _$$ErrorDataDtoImplCopyWith(
          _$ErrorDataDtoImpl value, $Res Function(_$ErrorDataDtoImpl) then) =
      __$$ErrorDataDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int statusCode, String errorMessage});
}

/// @nodoc
class __$$ErrorDataDtoImplCopyWithImpl<$Res>
    extends _$ErrorDataDtoCopyWithImpl<$Res, _$ErrorDataDtoImpl>
    implements _$$ErrorDataDtoImplCopyWith<$Res> {
  __$$ErrorDataDtoImplCopyWithImpl(
      _$ErrorDataDtoImpl _value, $Res Function(_$ErrorDataDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ErrorDataDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? errorMessage = null,
  }) {
    return _then(_$ErrorDataDtoImpl(
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ErrorDataDtoImpl extends _ErrorDataDto {
  const _$ErrorDataDtoImpl(
      {required this.statusCode, required this.errorMessage})
      : super._();

  factory _$ErrorDataDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ErrorDataDtoImplFromJson(json);

  @override
  final int statusCode;
  @override
  final String errorMessage;

  @override
  String toString() {
    return 'ErrorDataDto(statusCode: $statusCode, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorDataDtoImpl &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, statusCode, errorMessage);

  /// Create a copy of ErrorDataDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorDataDtoImplCopyWith<_$ErrorDataDtoImpl> get copyWith =>
      __$$ErrorDataDtoImplCopyWithImpl<_$ErrorDataDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ErrorDataDtoImplToJson(
      this,
    );
  }
}

abstract class _ErrorDataDto extends ErrorDataDto {
  const factory _ErrorDataDto(
      {required final int statusCode,
      required final String errorMessage}) = _$ErrorDataDtoImpl;
  const _ErrorDataDto._() : super._();

  factory _ErrorDataDto.fromJson(Map<String, dynamic> json) =
      _$ErrorDataDtoImpl.fromJson;

  @override
  int get statusCode;
  @override
  String get errorMessage;

  /// Create a copy of ErrorDataDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorDataDtoImplCopyWith<_$ErrorDataDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
