import 'package:dartz/dartz.dart';
import 'package:dummy_api/features/core/domain/fresh.dart';
import 'package:dummy_api/features/core/error/failure.dart';
import 'package:dummy_api/features/posts/domain/entity/post.dart';
import 'package:dummy_api/features/posts/domain/repository/product_repository.dart';
import 'package:dummy_api/features/posts/domain/usecases/get_posts.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPostsRepository extends Mock implements PostsRepository {}

void main() {
  late MockPostsRepository postsRepository;
  late GetPosts getPosts;
  late Post mockPost;

  setUpAll(() {
    postsRepository = MockPostsRepository();
    getPosts = GetPosts(postsRepository);
    mockPost = const Post(id: 1, title: 'title', body: 'body');
  });

  test("invoke  getPosts method on repository", () async {
    when(() => postsRepository.getPosts(any()))
        .thenAnswer((invocation) async => Right(Fresh.yes([mockPost])));
    await getPosts.call(1);
    verify(() => postsRepository.getPosts(any())).called(1);
    verifyNoMoreInteractions(postsRepository);
  });

  test("get post(domain) from repository ", () async {
    when(() => postsRepository.getPosts(any()))
        .thenAnswer((invocation) async => Right(Fresh.yes([mockPost])));
    final data = await getPosts.call(1);
    final matcher = Fresh.yes([mockPost]);
    expect(data, Right(matcher));
  });

  test("get  failure from repository when failed", () async {
    when(() => postsRepository.getPosts(any())).thenAnswer(
        (invocation) async => const Left(Failure.server(message: 'error')));
    final data = await getPosts.call(1);
    const matcher = Failure.server(message: 'error');
    expect(data, const Left(matcher));
  });
}
