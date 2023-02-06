import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

part 'response_header.g.dart';

@JsonSerializable()
class ResponseHeader {
  final String requestUrl;
  final String eTag;

  ResponseHeader({
    required this.requestUrl,
    required this.eTag,
  });

  factory ResponseHeader.fromJson(Map<String, dynamic> json) =>
      _$ResponseHeaderFromJson(json);

  factory ResponseHeader.fromResponse(Response response, String url) {
    return ResponseHeader(
      requestUrl: url,
      eTag: response.headers.map['ETag']![0],
    );
  }
}
