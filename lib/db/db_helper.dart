import 'package:skilltest_pt_bintoro/models/task.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static const _databaseName = "Task.db";

  static const int _version = 1;
  static const String _tableName = "tasks";

  static Database? _db;

  DBHelper._privateConstructor();
  static final DBHelper instance = DBHelper._privateConstructor();

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDatabase();
    return _db!;
  }

  _initDatabase() async {
    var path = await getDatabasesPath() + _databaseName;

    return await openDatabase(path, version: _version,
        onCreate: _onCreateTaskTable);
  }

  Future _onCreateTaskTable(Database database, int version) async {
    database.execute('''
          CREATE TABLE $_tableName (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            date TEXT,
            time INTEGER
          )
          ''');
  }

  Future<int> insert(Task model) async {

    Database db = await instance.database;
    var res = await db.insert(_tableName, model.toMap());
    return res;
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    var res = await db.query(_tableName, orderBy: "id DESC");
    return res;
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(_tableName, where: 'id = ?', whereArgs: [id]);
  }

}