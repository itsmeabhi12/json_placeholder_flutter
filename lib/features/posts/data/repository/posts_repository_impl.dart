import 'package:dartz/dartz.dart';
import 'package:dummy_api/features/core/domain/fresh.dart';
import 'package:dummy_api/features/core/error/failure.dart';
import 'package:dummy_api/features/posts/data/data_source/local/posts_local_data_source.dart';
import 'package:dummy_api/features/posts/data/data_source/remote/posts_remote_data_source.dart';
import 'package:dummy_api/features/posts/data/model/posts_model.dart';
import 'package:dummy_api/features/posts/domain/entity/post.dart';
import 'package:dummy_api/features/posts/domain/repository/product_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PostsRepository)
class PostsRepositoryImpl implements PostsRepository {
  final PostsRemoteDataSource remoteDataSource;
  final PostsLocalDataSource localDataSource;

  PostsRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<Either<Failure, Fresh<List<Post>>>> getPosts(int page) async {
    final response = await remoteDataSource.getPosts(page);

    return response.when(
      withNewData: (data) {
        final postsModel = data.map((e) => PostsModel.fromJson(e)).toList();
        localDataSource.upsertPosts(page, postsModel);
        return Right(Fresh.yes(postsModel.toDomain()));
      },
      notModified: () async {
        final postsModel = await localDataSource.getPosts(page);
        return Right(Fresh.yes(postsModel.toDomain()));
      },
      noConnection: () async {
        final postsModel = await localDataSource.getPosts(page);
        if (postsModel.isEmpty) {
          return const Left(Failure.netWork(message: 'No internet connection'));
        }
        return Right(Fresh.no(postsModel.toDomain()));
      },
      failed: (statusCode, message) {
        return Left(Failure.server(message: '$statusCode $message'));
      },
    );
  }
}

extension ListX on List<PostsModel> {
  List<Post> toDomain() => map((e) => e.toDomain()).toList();
}
