import 'package:flut2/app/database/sqlite/connection.dart';
import 'package:flut2/app/domain/entities/contact.dart';
import 'package:flut2/app/domain/interfaces/contact_dao.dart';
import 'package:sqflite/sqflite.dart';

class ContactDaoImpl implements ContactDao {
  Database _db;
  @override
  Future<List<Contact>> find() {
    // TODO: implement find
    throw UnimplementedError();
  }

  @override
  remove(int id) {}

  @override
  save(Contact contact) async {
    _db = (await Connection.get())!;
    if (contact.id == null) {
      var sql =
          'INSERT INTO contact (nome,telefone,email,url_avatar) VALUES (?,?,?,?)';
      _db.rawInsert(sql,
          [contact.nome, contact.telefone, contact.email, contact.urlAvatar]);
    } else {
      sql =
          'UPDATE contact SET nome = ?, telefone = ?, email = ?, url_avatar = ? WHERE id = ?';
      _db.rawUpdate(sql, [
        contact.nome,
        contact.telefone,
        contact.email,
        contact.urlAvatar,
        contact.id
      ]);
    }
  }
}
