import 'package:dummy_api/features/core/data/local/sqflite_database.dart';
import 'package:dummy_api/features/posts/data/data_source/local/posts_local_data_source.dart';
import 'package:dummy_api/features/posts/data/model/posts_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class MockSqf extends Sqflite implements Mock {}

class MockSqfLite extends SqfLiteDatabase implements Mock {}

void main() {
  late MockSqfLite mockSqfLite;
  late PostsLocalDataSource localDataSource;
  late List<Map<String, dynamic>> mockedData;
  setUpAll(() async {
    sqfliteFfiInit();
    mockSqfLite = MockSqfLite();

    databaseFactory = databaseFactoryFfi;

    final path = await getDatabasesPath();

    mockSqfLite.database = await databaseFactoryFfi.openDatabase(path);

    localDataSource = PostsLocalDataSourceImpl(mockSqfLite);

    mockedData = [
      {"id": 1, "title": "title", "body": "body", "page": 1},
    ];
  });

  tearDown(() async {
    await mockSqfLite.instance.delete(mockSqfLite.postsTable);
  });

  tearDownAll(() {
    mockSqfLite.instance.close();
  });

  test('return cached posts if exist ', () async {
    await mockSqfLite.instance.insert(mockSqfLite.postsTable, mockedData.first);
    final posts = await localDataSource.getPosts(1);
    final matcher = [PostsModel.fromJson(mockedData.first)];
    expect(posts, matcher);
  });

  test('return empty if not exist ', () async {
    final posts = await localDataSource.getPosts(1);
    final matcher = [];
    expect(posts, matcher);
  });

  test('upsert  posts ', () async {
    final postsModel = PostsModel.fromJson(mockedData.first);

    expect(
      () async => await localDataSource.upsertPosts(1, [postsModel]),
      isA<void>(),
    );
  });
}
