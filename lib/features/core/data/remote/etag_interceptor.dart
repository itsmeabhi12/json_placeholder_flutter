import 'package:dio/dio.dart';
import 'package:dummy_api/features/core/data/local/response_header_cache.dart';

class ETagInterceptor extends Interceptor {
  final ResponseHeaderCache cache;

  ETagInterceptor(this.cache);
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final eTag = cache.getETag(options.uri.toString());
    if (eTag != null) {
      options.headers.addEntries([MapEntry('If-None-Match', eTag)]);
    }
    handler.next(options);
  }
}
