import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> initilizaeDb() async {
  Future<Database> db = openDatabase(
      join(await getDatabasesPath(), 'myactivity.db'), onCreate: (db, version) {
    return db.execute(
        'CREATE TABLE ACTIVITY(ID INTEGER PRIMARY KEY AUTOINCREMENT, NIK INTEGER, FULLNAME TEXT, SUB_DIVISI TEXT, DATE_VISIT VARCHAR, LOCATION TEXT, DESCRIPTION TEXT, TARGET TEXT, STK_NUMBERS INTEGER)');
  }, version: 1);
  return db;
}

Future<void> insertItemsToDb(nik, fullname, sub_divisi, date_visit, location,
    description, target, stk_numbers) async {
  Database db = await initilizaeDb();
  await db.transaction((txn) {
    return txn.rawInsert(
        "INSERT INTO ACTIVITY(ID, NIK, FULLNAME, SUB_DIVISI, DATE_VISIT, LOCATION, DESCRIPTION, TARGET, STK_NUMBERS) VALUES($nik, '$fullname', '$sub_divisi', '$date_visit', '$location', '$description', '$target', $stk_numbers)");
  });
  print('Data Berhasil Ditambah');
}

Future<List> retreiveItemsFromDb() async {
  Database db = await initilizaeDb();
  return db.rawQuery('SELECT * FROM ACTIVITY');
}



// Future<List> insertItemToDb(title) async {
//   Database db = await initilizaeDb();
//   var addedDate = DateTime.now().toString();
//   db.rawQuery(
//       'INSERT INTO SHOPPING_ITEMS(TITLE,BOUGHT,DATE_ADDED) VALUES("$title", 0, "$addedDate" )');
//   return db.rawQuery('SELECT * FROM SHOPPING_ITEMS');
// }

// Future<List> getShoppingItmesFromDb() async {
//   Database db = await initilizaeDb();
//   return db.rawQuery('SELECT * FROM SHOPPING_ITEMS');
// }

// Future<void> updateItemBoughtState(int id, int bought) async {
//   Database db = await initilizaeDb();
//   db.rawQuery('UPDATE SHOPPING_ITEMS SET BOUGHT =$bought WHERE ID = $id');
// }

// Future<void> deleteItem(int id) async {
//   Database db = await initilizaeDb();
//   db.rawQuery('DELETE FROM SHOPPING_ITEMS WHERE ID = $id');
// }