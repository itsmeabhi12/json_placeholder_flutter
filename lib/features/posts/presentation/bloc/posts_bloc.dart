import 'package:dummy_api/features/core/domain/fresh.dart';
import 'package:dummy_api/features/posts/domain/usecases/get_posts.dart';
import 'package:dummy_api/features/posts/presentation/bloc/posts_events.dart';
import 'package:dummy_api/features/posts/presentation/bloc/posts_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc(this._getPosts) : super(PostsState.initial(posts: Fresh.yes([]))) {
    on<FetchPosts>(
      (event, emit) async {
        emit(PostsState.loading(posts: state.posts));

        final failureOrPosts = await _getPosts(_page);

        final newState = failureOrPosts.fold(
          (failure) => PostsState.failure(posts: state.posts, failure: failure),
          (posts) {
            _page++;
            return PostsState.loaded(
              posts: posts.copyWith(data: [
                ...state.posts.data,
                ...posts.data,
              ]),
            );
          },
        );

        emit(newState);
      },
    );
  }

  final GetPosts _getPosts;

  int _page = 1;

  @visibleForTesting
  int get page => _page;
}
