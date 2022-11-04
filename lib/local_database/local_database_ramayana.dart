import 'package:uki_flutter/models/activity.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class DbHelper {
  static final DbHelper _instance = DbHelper._internal();
  static Database? _database;

  //inisialisasi beberapa variabel yang dibutuhkan
  final String tableName = 'tableActivity';
  final String columnId = 'id';
  final String columnNik = 'nik';
  final String columnFullName = 'fullName';
  final String columnsubDivisi = 'subDivisi';
  final String columnDateVisit = 'dateVisit';
  final String columnLocation = 'location';
  final String columnStatus = 'status';
  final String columnDescription = 'description';
  final String columnTarget = 'target';
  final String columnStkNumbers = 'stkNumbers';

  DbHelper._internal();
  factory DbHelper() => _instance;

  //cek apakah database ada
  Future<Database?> get _db async {
    if (_database != null) {
      return _database;
    }
    _database = await _initDb();
    return _database;
  }

  Future<Database?> _initDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'activity.db');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  //membuat tabel dan field-fieldnya
  Future<void> _onCreate(Database db, int version) async {
    var sql = "CREATE TABLE $tableName($columnId INTEGER PRIMARY KEY, "
        "$columnNik TEXT,"
        "$columnFullName TEXT,"
        "$columnsubDivisi TEXT,"
        "$columnDateVisit TEXT,"
        "$columnLocation TEXT,"
        "$columnStatus TEXT,"
        "$columnDescription TEXT,"
        "$columnTarget TEXT,"
        "$columnStkNumbers TEXT)";
    await db.execute(sql);
  }

  //insert ke database
  Future<int?> saveActivity(KebutuhanAct activity) async {
    var dbClient = await _db;
    return await dbClient!.insert(tableName, activity.toMap());
  }

  //read database
  Future<List?> getAllActivity() async {
    var dbClient = await _db;
    var result = await dbClient!.query(tableName, columns: [
      columnId,
      columnNik,
      columnFullName,
      columnsubDivisi,
      columnDateVisit,
      columnLocation,
      columnStatus,
      columnDescription,
      columnTarget,
      columnStkNumbers
    ]);

    return result.toList();
  }

  // update database
  Future<int?> updateActivity(KebutuhanAct activity) async {
    var dbClient = await _db;
    return await dbClient!.update(tableName, activity.toMap(),
        where: '$columnId = ?', whereArgs: [activity.id]);
  }

  //hapus database
  Future<int?> deleteActivity(int id) async {
    var dbClient = await _db;
    return await dbClient!
        .delete(tableName, where: '$columnId = ?', whereArgs: [id]);
  }
}
