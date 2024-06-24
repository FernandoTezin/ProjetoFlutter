import 'package:agenda_flutter/app/database/database.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Connection {
  static Database? _db;

  static Future<Database> get() async {
    if (_db == null) {
      var path = join(await getDatabasesPath(), 'database.db');
      _db = await openDatabase(
        path,
        version: 1,
        onCreate: (db, v) {
          db.execute(createTable);
          db.execute(insert);
          db.execute(insert2);
          db.execute(insert3);
        },
      );
    }
    return _db!;
  }
}
