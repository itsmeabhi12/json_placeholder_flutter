import 'package:dummy_api/features/core/domain/fresh.dart';
import 'package:dummy_api/features/core/error/failure.dart';
import 'package:dummy_api/features/posts/domain/entity/post.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'posts_state.freezed.dart';

@freezed
class PostsState with _$PostsState {
  const factory PostsState.initial({required Fresh<List<Post>> posts}) =
      _Initial;
  const factory PostsState.loading({required Fresh<List<Post>> posts}) =
      _Loading;
  const factory PostsState.loaded({required Fresh<List<Post>> posts}) = _Loaded;
  const factory PostsState.failure(
      {required Fresh<List<Post>> posts, required Failure failure}) = _Failure;
}
