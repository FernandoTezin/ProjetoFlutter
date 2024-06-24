import 'package:agenda_flutter/app/database/connection.dart';
import 'package:agenda_flutter/app/domain/entities/contact.dart';
import 'package:sqflite/sqflite.dart';

import '../../domain/interfaces/contact_dao.dart';

class ContactDAOImpl implements ContactDAO {
  Database? _db;

  @override
  deleteContact(int id) async {
    _db = await Connection.get();
    var sql = 'DELETE FROM contact WHERE id = ?';
    _db!.rawDelete(sql, [id]);
  }

  @override
  Future<List<Contact>> getContact() async {
    _db = await Connection.get();
    var result = await _db!.query('contact');
    List<Map<String, dynamic>> list = result;
    List<Contact> contacts = List.generate(list.length, (i) {
      var row = list[i];
      return Contact(
          id: row['id'],
          nome: row['name'],
          telefone: row['phone'],
          email: row['email'],
          url_avatar: row['avatar']);
    });
    return contacts;
  }

  @override
  saveContact(Contact contact) async {
    _db = await Connection.get();
    var sql;
    if (contact.id == null) {
      sql =
          'INSERT INTO contact (name, phone, email, avatar) VALUES (?, ?, ?, ?)';
      _db!.rawInsert(sql,
          [contact.nome, contact.telefone, contact.email, contact.url_avatar]);
    } else {
      sql =
          'UPDATE contact SET name = ?, phone = ?, email = ?, avatar = ? WHERE id = ?';
      _db!.rawUpdate(sql, [
        contact.nome,
        contact.telefone,
        contact.email,
        contact.url_avatar,
        contact.id
      ]);
    }
  }
}
