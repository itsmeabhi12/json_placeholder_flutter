import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:dummy_api/features/core/domain/fresh.dart';
import 'package:dummy_api/features/core/error/failure.dart';
import 'package:dummy_api/features/posts/domain/entity/post.dart';
import 'package:dummy_api/features/posts/domain/usecases/get_posts.dart';
import 'package:dummy_api/features/posts/presentation/bloc/posts_bloc.dart';
import 'package:dummy_api/features/posts/presentation/bloc/posts_events.dart';
import 'package:dummy_api/features/posts/presentation/bloc/posts_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetPosts extends Mock implements GetPosts {}

void main() {
  late MockGetPosts getPosts;
  late PostsBloc postsBloc;
  late Post mockPost;
  late Failure mockFailure;
  setUp(() {
    getPosts = MockGetPosts();
    postsBloc = PostsBloc(getPosts);
    mockPost = const Post(id: 1, title: "title", body: "body");
    mockFailure = const Failure.server(message: "message");
  });
  tearDown(() {
    postsBloc.close();
  });

  test("initial state is PostsState.initial", () {
    expect(postsBloc.state, PostsState.initial(posts: Fresh.yes([])));
  });

  blocTest(
    "should emit  loading and  loaded when success",
    build: () => postsBloc,
    act: (bloc) {
      when(() => getPosts.call(any()))
          .thenAnswer((invocation) async => Right(Fresh.yes([mockPost])));
      bloc.add(FetchPosts());
    },
    expect: () => [
      PostsState.loading(posts: Fresh.yes([])),
      PostsState.loaded(posts: Fresh.yes([mockPost]))
    ],
    verify: (_) {
      verify(() => getPosts.call(any())).called(1);
    },
  );

  blocTest(
    "should emit  loading and  failure when failed",
    build: () => postsBloc,
    act: (bloc) {
      when(() => getPosts.call(any()))
          .thenAnswer((invocation) async => Left(mockFailure));
      bloc.add(FetchPosts());
    },
    expect: () => [
      PostsState.loading(posts: Fresh.yes([])),
      PostsState.failure(
        posts: Fresh.yes([]),
        failure: mockFailure,
      )
    ],
    verify: (_) {
      verify(() => getPosts.call(any())).called(1);
    },
  );

  blocTest(
    "should increase page number for each successful state",
    build: () => postsBloc,
    act: (bloc) {
      when(() => getPosts.call(any()))
          .thenAnswer((invocation) async => Right(Fresh.yes([mockPost])));
      bloc.add(FetchPosts());
    },
    verify: (_) {
      expect(_.page, 2);
    },
  );
}
