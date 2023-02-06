import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.server({String? message}) = _Server;
  const factory Failure.cache({String? message}) = _Cache;
  const factory Failure.netWork({String? message}) = _Network;
}
