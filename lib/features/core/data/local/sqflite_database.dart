import 'package:sqflite/sqflite.dart';

class SqfLiteDatabase {
  late Database _database;

  Database get instance => _database;

  set database(Database database) {
    _database = database;
  }

  //All Tables in this db
  final String postsTable = 'posts';

  Future<void> init() async {
    final dbPath = await getDatabasesPath();
    _database = await openDatabase(
      '$dbPath/database.db',
      version: 1,
      onCreate: (database, __) async {
        await createPostsTable(database);
      },
    );
  }

  Future<void> createPostsTable(Database database) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const titleType = 'TEXT NOT NULL';
    const bodyType = 'TEXT NOT NULL';
    const pageNumberType = "INTEGER NOT NULL";

    await database.execute(
      'CREATE TABLE $postsTable(id $idType, title $titleType, body $bodyType, page $pageNumberType)',
    );
  }
}
