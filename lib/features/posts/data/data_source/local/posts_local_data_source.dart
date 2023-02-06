import 'package:dummy_api/features/core/data/local/sqflite_database.dart';
import 'package:dummy_api/features/posts/data/model/posts_model.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sql.dart';

abstract class PostsLocalDataSource {
  Future<void> upsertPosts(int page, List<PostsModel> posts);
  Future<List<PostsModel>> getPosts(int page);
}

@Singleton(as: PostsLocalDataSource)
class PostsLocalDataSourceImpl implements PostsLocalDataSource {
  final SqfLiteDatabase database;

  PostsLocalDataSourceImpl(this.database);

  ///UPSERT -> Update if exist else insert
  @override
  Future<void> upsertPosts(int page, List<PostsModel> posts) async {
    for (var post in posts) {
      await database.instance.insert(
        database.postsTable,
        post.toJson()..addEntries([MapEntry("page", page)]),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  @override
  Future<List<PostsModel>> getPosts(int page) async {
    final data = await database.instance
        .query(database.postsTable, where: 'page = ?', whereArgs: [page]);
    return data.map((json) => PostsModel.fromJson(json)).toList();
  }
}
