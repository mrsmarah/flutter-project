import 'package:flutter_app/storage/model.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DBHelper {
  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDatabase();
    return _db;
  }

  initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'posts.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db
        .execute('CREATE TABLE post (id INTEGER PRIMARY KEY, userId INTEGER PRIMARY KEY, title TEXT, body TEXT)');
  }
/////////////////// INSERT DATA ///////////////////
  Future<Post> add(Post post) async {
    var dbClient = await db;
    post.id = await dbClient.insert('post', post.toMap());
    return post;
  }

  ////////////////// RETRIEVE DATA ///////////////////
  Future<List<Post>> getPosts() async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query('post', columns: ['id', 'userId' , 'title' , 'body']);
    List<Post> posts = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        posts.add(Post.fromMap(maps[i]));
      }
    }
    return posts;
  }


  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}
