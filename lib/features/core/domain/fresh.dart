import 'package:freezed_annotation/freezed_annotation.dart';

part 'fresh.freezed.dart';

//Wrapper class that determines weather the data is fresh or not
@freezed
class Fresh<T> with _$Fresh<T> {
  const factory Fresh({
    required T data,
    required bool fresh,
  }) = _Fresh<T>;

  factory Fresh.yes(T data) => Fresh(data: data, fresh: true);

  factory Fresh.no(T data) => Fresh(data: data, fresh: false);
}
