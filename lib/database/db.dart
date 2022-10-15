//dbhelper ini dibuat untuk
//membuat database, membuat tabel, proses insert, read, update dan delete
        
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';
import 'package:uki_flutter/model/kontak.dart';
        
class DbHelper {
    static final DbHelper _instance = DbHelper._internal();
    static Database? _database;
        
    //inisialisasi beberapa variabel yang dibutuhkan
    final String tableRamayana = 'tableRamayana';
    final String columnId = 'id';
    final String columnNIK = 'nik';
    final String columnFullname = 'fullname';
    final String columnSubdivisi = 'subdivisi';
    final String columnDateVisit = 'datevisit';
    final String columnLocation = 'location';
    final String columnDescription = 'description';
    final String columnTarget = 'target';
    final String columnStkNumbers = 'stknumbers';
        
    DbHelper._internal();
    factory DbHelper() => _instance;
        
    //cek apakah database ada
    Future<Database?> get _db  async {
        if (_database != null) {
            return _database;
        }
        _database = await _initDb();
        return _database;
    }
        
    Future<Database?> _initDb() async {
        String databasePath = await getDatabasesPath();
        String path = join(databasePath, 'ramayana.db');
        
        return await openDatabase(path, version: 1, onCreate: _onCreate);
    }
        
    //membuat tabel dan field-fieldnya
    Future<void> _onCreate(Database db, int version) async {
        var sql = "CREATE TABLE $tableRamayana($columnId INTEGER PRIMARY KEY, "
            "$columnNIK TEXT,"
            "$columnFullname TEXT,"
            "$columnSubdivisi TEXT,"
            "$columnDateVisit TEXT,"
            "$columnLocation TEXT,"
            "$columnDescription TEXT,"
            "$columnTarget TEXT,"
            "$columnStkNumbers TEXT)";
             await db.execute(sql);
    }
        
    //insert ke database
    Future<int?> saveActivity(Activity activity) async {
        var dbClient = await _db;
        return await dbClient!.insert(tableRamayana, activity.toMap());
    }
        
    //read database
    Future<List?> getAllActivity() async {
        var dbClient = await _db;
        var result = await dbClient!.query(tableRamayana, columns: [
            columnId,
            columnNIK,
            columnFullname,
            columnSubdivisi,
            columnDateVisit,
            columnLocation,
            columnDescription,
            columnTarget,
            columnStkNumbers
        ]);
        
        return result.toList();
    }
        
    //update database
    Future<int?> updateActivity(Activity activity) async {
        var dbClient = await _db;
        return await dbClient!.update(tableRamayana, activity.toMap(), where: '$columnId = ?', whereArgs: [activity.id]);
    }
        
    //hapus database
    Future<int?> deleteActivity(int id) async {
        var dbClient = await _db;
        return await dbClient!.delete(tableRamayana, where: '$columnId = ?', whereArgs: [id]);
    }
}