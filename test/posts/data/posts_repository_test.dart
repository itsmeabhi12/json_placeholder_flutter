import 'package:dartz/dartz.dart';
import 'package:dummy_api/features/core/data/remote/remote_response.dart';
import 'package:dummy_api/features/core/domain/fresh.dart';
import 'package:dummy_api/features/core/error/failure.dart';
import 'package:dummy_api/features/posts/data/data_source/local/posts_local_data_source.dart';
import 'package:dummy_api/features/posts/data/data_source/remote/posts_remote_data_source.dart';
import 'package:dummy_api/features/posts/data/model/posts_model.dart';
import 'package:dummy_api/features/posts/data/repository/posts_repository_impl.dart';
import 'package:dummy_api/features/posts/domain/repository/product_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPostsRemoteDataSource extends Mock implements PostsRemoteDataSource {}

class MockPostsLocalDataSource extends Mock implements PostsLocalDataSource {}

void main() {
  late MockPostsLocalDataSource localDataSource;
  late MockPostsRemoteDataSource remoteDataSource;
  late PostsRepository postsRepository;
  late List<Map<String, dynamic>> mockedData;
  late PostsModel postsModel;
  setUpAll(() {
    localDataSource = MockPostsLocalDataSource();
    remoteDataSource = MockPostsRemoteDataSource();
    postsRepository = PostsRepositoryImpl(remoteDataSource, localDataSource);
    mockedData = [
      {"userId": 1, "id": 1, "title": "title", "body": "body"},
    ];
    postsModel = PostsModel.fromJson(mockedData.first);
  });

  test('return fresh data  and cache it', () async {
    when(() => remoteDataSource.getPosts(any()))
        .thenAnswer((_) async => RemoteResponse.withNewData(mockedData));
    when(() => localDataSource.upsertPosts(any(), any()))
        .thenAnswer((invocation) async => {});

    final data = await postsRepository.getPosts(1);

    final matcher = Fresh.yes([postsModel.toDomain()]);
    expect(data, Right(matcher));
    verify(() => localDataSource.upsertPosts(any(), any())).called(1);
  });

  test('return from cache (Fresh.yes(data)) on not modified response ',
      () async {
    when(() => remoteDataSource.getPosts(any()))
        .thenAnswer((_) async => const RemoteResponse.notModified());
    when(() => localDataSource.getPosts(any()))
        .thenAnswer((invocation) async => [postsModel]);

    final data = await postsRepository.getPosts(1);

    final matcher = Fresh.yes([postsModel.toDomain()]);

    expect(data, Right(matcher));

    verify(() => localDataSource.getPosts(any())).called(1);
  });

  test('return from cache (Fresh.no(data)) on No internet ', () async {
    when(() => remoteDataSource.getPosts(any()))
        .thenAnswer((_) async => const RemoteResponse.noConnection());
    when(() => localDataSource.getPosts(any()))
        .thenAnswer((invocation) async => [postsModel]);

    final data = await postsRepository.getPosts(1);

    final matcher = Fresh.no([postsModel.toDomain()]);

    expect(data, Right(matcher));

    verify(() => localDataSource.getPosts(any())).called(1);
  });

  test('return network failure when no cache & internet ', () async {
    when(() => remoteDataSource.getPosts(any()))
        .thenAnswer((_) async => const RemoteResponse.noConnection());
    when(() => localDataSource.getPosts(any()))
        .thenAnswer((invocation) async => []);

    final data = await postsRepository.getPosts(1);

    const matcher = Failure.netWork(message: 'No internet connection');

    expect(data, const Left(matcher));

    verify(() => localDataSource.getPosts(any())).called(1);
  });

  test('return server failure  when failed', () async {
    when(() => remoteDataSource.getPosts(any()))
        .thenAnswer((_) async => const RemoteResponse.failed(statusCode: 400));

    final data = await postsRepository.getPosts(1);

    const matcher = Left(Failure.server(message: '400 null'));

    expect(data, matcher);
    verifyNoMoreInteractions(localDataSource);
  });
}
