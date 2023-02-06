import 'package:dartz/dartz.dart';
import 'package:dummy_api/features/core/domain/fresh.dart';
import 'package:dummy_api/features/core/error/failure.dart';
import 'package:dummy_api/features/core/usecases/use_case.dart';
import 'package:dummy_api/features/posts/domain/entity/post.dart';
import 'package:dummy_api/features/posts/domain/repository/product_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class GetPosts
    extends UseCase<Future<Either<Failure, Fresh<List<Post>>>>, int> {
  GetPosts(this.repository);

  final PostsRepository repository;

  @override
  Future<Either<Failure, Fresh<List<Post>>>> call(int params) async {
    return await repository.getPosts(params);
  }
}
