
import 'package:flut2/app/database/script.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class Connection {
  static Database? _db;

  static Future<Database?> get() async {
    if (_db == null) {
      var path = join(await getDatabasesPath(), 'banco_contatos');
      _db ??= await openDatabase(path, version: 1, onCreate: (db, version) {
        db.execute(createTable);
        db.execute(insert);
        db.execute(insert2);
        db.execute(insert3);
      });
    }
    return _db;
  }
}
