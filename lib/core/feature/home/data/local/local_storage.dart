import 'package:live_test/core/feature/home/data/model/user_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  static final DataBaseHelper _instance = DataBaseHelper._internal();

  factory DataBaseHelper() => _instance;
  static Database? _database;
  DataBaseHelper._internal();

  Future<Database> get database async {
    _database ??= await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'user.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          "CREATE TABLE users(id INTEGER PRIMARTY KEY AUTOINCREMENT,name TEXT NOT NULL,email TEXT NOT NULL,phone INTEGER)",
        );
      },
    );
  }

  Future<int> insertUser(UserModel user) async {
    final db = await database;
    return await db.insert('users', user.toJson());
  }

  Future<List<UserModel>> getUser() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('user');
    return maps.map((map) => UserModel.fromJson(map)).toList();
  }
}
