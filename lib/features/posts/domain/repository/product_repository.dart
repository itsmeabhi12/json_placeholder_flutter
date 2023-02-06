import 'package:dartz/dartz.dart';
import 'package:dummy_api/features/core/domain/fresh.dart';
import 'package:dummy_api/features/core/error/failure.dart';
import 'package:dummy_api/features/posts/domain/entity/post.dart';

abstract class PostsRepository {
  Future<Either<Failure, Fresh<List<Post>>>> getPosts(int page);
}
