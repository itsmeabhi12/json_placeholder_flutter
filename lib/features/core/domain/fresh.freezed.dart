// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fresh.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Fresh<T> {
  T get data => throw _privateConstructorUsedError;
  bool get fresh => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FreshCopyWith<T, Fresh<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FreshCopyWith<T, $Res> {
  factory $FreshCopyWith(Fresh<T> value, $Res Function(Fresh<T>) then) =
      _$FreshCopyWithImpl<T, $Res, Fresh<T>>;
  @useResult
  $Res call({T data, bool fresh});
}

/// @nodoc
class _$FreshCopyWithImpl<T, $Res, $Val extends Fresh<T>>
    implements $FreshCopyWith<T, $Res> {
  _$FreshCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? fresh = null,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
      fresh: null == fresh
          ? _value.fresh
          : fresh // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FreshCopyWith<T, $Res> implements $FreshCopyWith<T, $Res> {
  factory _$$_FreshCopyWith(
          _$_Fresh<T> value, $Res Function(_$_Fresh<T>) then) =
      __$$_FreshCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T data, bool fresh});
}

/// @nodoc
class __$$_FreshCopyWithImpl<T, $Res>
    extends _$FreshCopyWithImpl<T, $Res, _$_Fresh<T>>
    implements _$$_FreshCopyWith<T, $Res> {
  __$$_FreshCopyWithImpl(_$_Fresh<T> _value, $Res Function(_$_Fresh<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? fresh = null,
  }) {
    return _then(_$_Fresh<T>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
      fresh: null == fresh
          ? _value.fresh
          : fresh // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Fresh<T> implements _Fresh<T> {
  const _$_Fresh({required this.data, required this.fresh});

  @override
  final T data;
  @override
  final bool fresh;

  @override
  String toString() {
    return 'Fresh<$T>(data: $data, fresh: $fresh)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fresh<T> &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.fresh, fresh) || other.fresh == fresh));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(data), fresh);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FreshCopyWith<T, _$_Fresh<T>> get copyWith =>
      __$$_FreshCopyWithImpl<T, _$_Fresh<T>>(this, _$identity);
}

abstract class _Fresh<T> implements Fresh<T> {
  const factory _Fresh({required final T data, required final bool fresh}) =
      _$_Fresh<T>;

  @override
  T get data;
  @override
  bool get fresh;
  @override
  @JsonKey(ignore: true)
  _$$_FreshCopyWith<T, _$_Fresh<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
