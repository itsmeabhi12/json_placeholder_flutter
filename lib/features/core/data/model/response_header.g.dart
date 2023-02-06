// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_header.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseHeader _$ResponseHeaderFromJson(Map<String, dynamic> json) =>
    ResponseHeader(
      requestUrl: json['requestUrl'] as String,
      eTag: json['eTag'] as String,
    );

Map<String, dynamic> _$ResponseHeaderToJson(ResponseHeader instance) =>
    <String, dynamic>{
      'requestUrl': instance.requestUrl,
      'eTag': instance.eTag,
    };
