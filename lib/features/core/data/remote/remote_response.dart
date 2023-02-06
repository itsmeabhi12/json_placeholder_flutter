import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_response.freezed.dart';

@freezed
class RemoteResponse<T> with _$RemoteResponse<T> {
  const factory RemoteResponse.withNewData(
    T data,
  ) = Success<T>;
  const factory RemoteResponse.notModified() = NotModified<T>;
  const factory RemoteResponse.noConnection() = NoConnection<T>;
  const factory RemoteResponse.failed({
    required int statusCode,
    String? message,
  }) = Failed<T>;
}
