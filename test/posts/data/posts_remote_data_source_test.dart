import 'package:dio/dio.dart';
import 'package:dummy_api/features/core/data/remote/remote_response.dart';
import 'package:dummy_api/features/posts/data/data_source/remote/posts_remote_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late MockDio mockDio;
  late PostsRemoteDataSource remoteDataSource;
  late Response mockResponse;

  setUp(() {
    mockDio = MockDio();
    remoteDataSource = PostsRemoteDataSourceImpl(mockDio);
  });

  group('get Posts', () {
    setUp(() {
      mockResponse = Response(
        data: {},
        statusCode: 304,
        headers: Headers()..add('ETag', "value"),
        requestOptions: RequestOptions(path: ''),
      );
    });

    // test('response with new data', () async {
    //   mockResponse.statusCode = 200;
    //   mockResponse.data = [];
    //   when(() => mockDio.get(any())).thenAnswer(
    //     (_) async => mockResponse,
    //   );
    //   final data = await remoteDataSource.getPosts(1);

    //   const matcher =
    //       RemoteResponse<List<Map<String, dynamic>>>.withNewData([]);

    //   expect(data, matcher);
    // });

    test('make sure that get method is called ', () async {
      when(() => mockDio.get(any())).thenAnswer(
        (_) async => mockResponse,
      );
      await remoteDataSource.getPosts(1);

      verify(() => mockDio.get(any())).called(1);
      verifyNoMoreInteractions(mockDio);
    });

    test('should return not modified response ', () async {
      mockDio.options = BaseOptions(
        validateStatus: (status) =>
            status != null && status >= 200 && status < 400,
      );
      when(() => mockDio.get(any()))
          .thenAnswer((invocation) async => mockResponse);

      final response = await remoteDataSource.getPosts(1);

      expect(response,
          const RemoteResponse<List<Map<String, dynamic>>>.notModified());
      expect(response, isA<RemoteResponse>());
    });

    test('should return failed when failed (>=400 &&<=500)', () async {
      mockResponse.statusCode = 400;

      when(() => mockDio.get(any()))
          .thenAnswer((invocation) async => mockResponse);

      final response = await remoteDataSource.getPosts(1);

      expect(
          response,
          const RemoteResponse<List<Map<String, dynamic>>>.failed(
              statusCode: 400));
      expect(
          response,
          isA<RemoteResponse>()
              .having((p0) => (p0 as Failed).statusCode, 'statusCode', 400));
    });

    test("throw un-expected exception", () {
      when(() => mockDio.get(any()))
          .thenThrow(const FormatException("mocked exception"));

      expect(
        () async => remoteDataSource.getPosts(1),
        throwsA(isA<FormatException>()),
      );
    });

    test("handle known exception", () async {
      when(() => mockDio.get(any())).thenThrow(
        DioError(
          response: mockResponse..statusCode = 400,
          requestOptions: mockResponse.requestOptions,
        ),
      );

      final response = await remoteDataSource.getPosts(1);

      expect(
          response,
          const RemoteResponse<List<Map<String, dynamic>>>.failed(
              statusCode: 400));
    });
  });
}
