import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dummy_api/features/core/api/api_paths.dart';
import 'package:dummy_api/features/core/data/local/response_header_cache.dart';
import 'package:dummy_api/features/core/data/model/response_header.dart';
import 'package:dummy_api/features/core/data/remote/remote_response.dart';
import 'package:injectable/injectable.dart';

abstract class PostsRemoteDataSource {
  Future<RemoteResponse<List<Map<String, dynamic>>>> getPosts(int page);
}

@singleton
class PostsRemoteDataSourceImpl implements PostsRemoteDataSource {
  PostsRemoteDataSourceImpl(this.dio);

  final Dio dio;

  @override
  Future<RemoteResponse<List<Map<String, dynamic>>>> getPosts(int page) async {
    try {
      final requestUrl = ApiPath.getPostsPath(page);

      final response = await dio.get(requestUrl);

      final statusCode = response.statusCode!;

      if (statusCode == 200) {
        final validResponse = response.data
            .map<Map<String, dynamic>>((e) => e as Map<String, dynamic>)
            .toList();

        await ResponseHeaderCache()
            .saveHeader(ResponseHeader.fromResponse(response, requestUrl));
        return RemoteResponse.withNewData(validResponse);
      } else if (statusCode == 304) {
        return const RemoteResponse.notModified();
      } else {
        return RemoteResponse.failed(
          statusCode: statusCode,
          message: response.data?['message'],
        );
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.other && e.error is SocketException) {
        return const RemoteResponse.noConnection();
      } else if (e.response != null) {
        return RemoteResponse.failed(statusCode: e.response!.statusCode!);
      } else {
        rethrow;
      }
    } catch (e) {
      rethrow;
    }
  }
}
