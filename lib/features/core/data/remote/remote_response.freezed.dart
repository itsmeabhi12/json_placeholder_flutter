// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remote_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RemoteResponse<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) withNewData,
    required TResult Function() notModified,
    required TResult Function() noConnection,
    required TResult Function(int statusCode, String? message) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? withNewData,
    TResult? Function()? notModified,
    TResult? Function()? noConnection,
    TResult? Function(int statusCode, String? message)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? withNewData,
    TResult Function()? notModified,
    TResult Function()? noConnection,
    TResult Function(int statusCode, String? message)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success<T> value) withNewData,
    required TResult Function(NotModified<T> value) notModified,
    required TResult Function(NoConnection<T> value) noConnection,
    required TResult Function(Failed<T> value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Success<T> value)? withNewData,
    TResult? Function(NotModified<T> value)? notModified,
    TResult? Function(NoConnection<T> value)? noConnection,
    TResult? Function(Failed<T> value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success<T> value)? withNewData,
    TResult Function(NotModified<T> value)? notModified,
    TResult Function(NoConnection<T> value)? noConnection,
    TResult Function(Failed<T> value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoteResponseCopyWith<T, $Res> {
  factory $RemoteResponseCopyWith(
          RemoteResponse<T> value, $Res Function(RemoteResponse<T>) then) =
      _$RemoteResponseCopyWithImpl<T, $Res, RemoteResponse<T>>;
}

/// @nodoc
class _$RemoteResponseCopyWithImpl<T, $Res, $Val extends RemoteResponse<T>>
    implements $RemoteResponseCopyWith<T, $Res> {
  _$RemoteResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SuccessCopyWith<T, $Res> {
  factory _$$SuccessCopyWith(
          _$Success<T> value, $Res Function(_$Success<T>) then) =
      __$$SuccessCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$SuccessCopyWithImpl<T, $Res>
    extends _$RemoteResponseCopyWithImpl<T, $Res, _$Success<T>>
    implements _$$SuccessCopyWith<T, $Res> {
  __$$SuccessCopyWithImpl(
      _$Success<T> _value, $Res Function(_$Success<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$Success<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$Success<T> implements Success<T> {
  const _$Success(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'RemoteResponse<$T>.withNewData(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Success<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessCopyWith<T, _$Success<T>> get copyWith =>
      __$$SuccessCopyWithImpl<T, _$Success<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) withNewData,
    required TResult Function() notModified,
    required TResult Function() noConnection,
    required TResult Function(int statusCode, String? message) failed,
  }) {
    return withNewData(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? withNewData,
    TResult? Function()? notModified,
    TResult? Function()? noConnection,
    TResult? Function(int statusCode, String? message)? failed,
  }) {
    return withNewData?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? withNewData,
    TResult Function()? notModified,
    TResult Function()? noConnection,
    TResult Function(int statusCode, String? message)? failed,
    required TResult orElse(),
  }) {
    if (withNewData != null) {
      return withNewData(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success<T> value) withNewData,
    required TResult Function(NotModified<T> value) notModified,
    required TResult Function(NoConnection<T> value) noConnection,
    required TResult Function(Failed<T> value) failed,
  }) {
    return withNewData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Success<T> value)? withNewData,
    TResult? Function(NotModified<T> value)? notModified,
    TResult? Function(NoConnection<T> value)? noConnection,
    TResult? Function(Failed<T> value)? failed,
  }) {
    return withNewData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success<T> value)? withNewData,
    TResult Function(NotModified<T> value)? notModified,
    TResult Function(NoConnection<T> value)? noConnection,
    TResult Function(Failed<T> value)? failed,
    required TResult orElse(),
  }) {
    if (withNewData != null) {
      return withNewData(this);
    }
    return orElse();
  }
}

abstract class Success<T> implements RemoteResponse<T> {
  const factory Success(final T data) = _$Success<T>;

  T get data;
  @JsonKey(ignore: true)
  _$$SuccessCopyWith<T, _$Success<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotModifiedCopyWith<T, $Res> {
  factory _$$NotModifiedCopyWith(
          _$NotModified<T> value, $Res Function(_$NotModified<T>) then) =
      __$$NotModifiedCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$NotModifiedCopyWithImpl<T, $Res>
    extends _$RemoteResponseCopyWithImpl<T, $Res, _$NotModified<T>>
    implements _$$NotModifiedCopyWith<T, $Res> {
  __$$NotModifiedCopyWithImpl(
      _$NotModified<T> _value, $Res Function(_$NotModified<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NotModified<T> implements NotModified<T> {
  const _$NotModified();

  @override
  String toString() {
    return 'RemoteResponse<$T>.notModified()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NotModified<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) withNewData,
    required TResult Function() notModified,
    required TResult Function() noConnection,
    required TResult Function(int statusCode, String? message) failed,
  }) {
    return notModified();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? withNewData,
    TResult? Function()? notModified,
    TResult? Function()? noConnection,
    TResult? Function(int statusCode, String? message)? failed,
  }) {
    return notModified?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? withNewData,
    TResult Function()? notModified,
    TResult Function()? noConnection,
    TResult Function(int statusCode, String? message)? failed,
    required TResult orElse(),
  }) {
    if (notModified != null) {
      return notModified();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success<T> value) withNewData,
    required TResult Function(NotModified<T> value) notModified,
    required TResult Function(NoConnection<T> value) noConnection,
    required TResult Function(Failed<T> value) failed,
  }) {
    return notModified(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Success<T> value)? withNewData,
    TResult? Function(NotModified<T> value)? notModified,
    TResult? Function(NoConnection<T> value)? noConnection,
    TResult? Function(Failed<T> value)? failed,
  }) {
    return notModified?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success<T> value)? withNewData,
    TResult Function(NotModified<T> value)? notModified,
    TResult Function(NoConnection<T> value)? noConnection,
    TResult Function(Failed<T> value)? failed,
    required TResult orElse(),
  }) {
    if (notModified != null) {
      return notModified(this);
    }
    return orElse();
  }
}

abstract class NotModified<T> implements RemoteResponse<T> {
  const factory NotModified() = _$NotModified<T>;
}

/// @nodoc
abstract class _$$NoConnectionCopyWith<T, $Res> {
  factory _$$NoConnectionCopyWith(
          _$NoConnection<T> value, $Res Function(_$NoConnection<T>) then) =
      __$$NoConnectionCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$NoConnectionCopyWithImpl<T, $Res>
    extends _$RemoteResponseCopyWithImpl<T, $Res, _$NoConnection<T>>
    implements _$$NoConnectionCopyWith<T, $Res> {
  __$$NoConnectionCopyWithImpl(
      _$NoConnection<T> _value, $Res Function(_$NoConnection<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NoConnection<T> implements NoConnection<T> {
  const _$NoConnection();

  @override
  String toString() {
    return 'RemoteResponse<$T>.noConnection()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NoConnection<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) withNewData,
    required TResult Function() notModified,
    required TResult Function() noConnection,
    required TResult Function(int statusCode, String? message) failed,
  }) {
    return noConnection();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? withNewData,
    TResult? Function()? notModified,
    TResult? Function()? noConnection,
    TResult? Function(int statusCode, String? message)? failed,
  }) {
    return noConnection?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? withNewData,
    TResult Function()? notModified,
    TResult Function()? noConnection,
    TResult Function(int statusCode, String? message)? failed,
    required TResult orElse(),
  }) {
    if (noConnection != null) {
      return noConnection();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success<T> value) withNewData,
    required TResult Function(NotModified<T> value) notModified,
    required TResult Function(NoConnection<T> value) noConnection,
    required TResult Function(Failed<T> value) failed,
  }) {
    return noConnection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Success<T> value)? withNewData,
    TResult? Function(NotModified<T> value)? notModified,
    TResult? Function(NoConnection<T> value)? noConnection,
    TResult? Function(Failed<T> value)? failed,
  }) {
    return noConnection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success<T> value)? withNewData,
    TResult Function(NotModified<T> value)? notModified,
    TResult Function(NoConnection<T> value)? noConnection,
    TResult Function(Failed<T> value)? failed,
    required TResult orElse(),
  }) {
    if (noConnection != null) {
      return noConnection(this);
    }
    return orElse();
  }
}

abstract class NoConnection<T> implements RemoteResponse<T> {
  const factory NoConnection() = _$NoConnection<T>;
}

/// @nodoc
abstract class _$$FailedCopyWith<T, $Res> {
  factory _$$FailedCopyWith(
          _$Failed<T> value, $Res Function(_$Failed<T>) then) =
      __$$FailedCopyWithImpl<T, $Res>;
  @useResult
  $Res call({int statusCode, String? message});
}

/// @nodoc
class __$$FailedCopyWithImpl<T, $Res>
    extends _$RemoteResponseCopyWithImpl<T, $Res, _$Failed<T>>
    implements _$$FailedCopyWith<T, $Res> {
  __$$FailedCopyWithImpl(_$Failed<T> _value, $Res Function(_$Failed<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? message = freezed,
  }) {
    return _then(_$Failed<T>(
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$Failed<T> implements Failed<T> {
  const _$Failed({required this.statusCode, this.message});

  @override
  final int statusCode;
  @override
  final String? message;

  @override
  String toString() {
    return 'RemoteResponse<$T>.failed(statusCode: $statusCode, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Failed<T> &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, statusCode, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailedCopyWith<T, _$Failed<T>> get copyWith =>
      __$$FailedCopyWithImpl<T, _$Failed<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) withNewData,
    required TResult Function() notModified,
    required TResult Function() noConnection,
    required TResult Function(int statusCode, String? message) failed,
  }) {
    return failed(statusCode, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? withNewData,
    TResult? Function()? notModified,
    TResult? Function()? noConnection,
    TResult? Function(int statusCode, String? message)? failed,
  }) {
    return failed?.call(statusCode, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? withNewData,
    TResult Function()? notModified,
    TResult Function()? noConnection,
    TResult Function(int statusCode, String? message)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(statusCode, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success<T> value) withNewData,
    required TResult Function(NotModified<T> value) notModified,
    required TResult Function(NoConnection<T> value) noConnection,
    required TResult Function(Failed<T> value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Success<T> value)? withNewData,
    TResult? Function(NotModified<T> value)? notModified,
    TResult? Function(NoConnection<T> value)? noConnection,
    TResult? Function(Failed<T> value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success<T> value)? withNewData,
    TResult Function(NotModified<T> value)? notModified,
    TResult Function(NoConnection<T> value)? noConnection,
    TResult Function(Failed<T> value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class Failed<T> implements RemoteResponse<T> {
  const factory Failed({required final int statusCode, final String? message}) =
      _$Failed<T>;

  int get statusCode;
  String? get message;
  @JsonKey(ignore: true)
  _$$FailedCopyWith<T, _$Failed<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
