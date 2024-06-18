import 'package:flut2/app/my_app.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flut2/app/database/script.dart';

import '../database/sqlite/connection.dart';

class ContactList extends StatelessWidget {
  Future<List<Map<String, dynamic>>> _buscar() async {
    Database? db = await Connection.get();
    return db!.query('contact');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

Future<List<Map<String, dynamic>>> _buscar() async {
  String path = join(await getDatabasesPath(), 'banco');
  Database db = await openDatabase(path, version: 1, onCreate: (db, version) {
    db.execute(createTable);
    db.execute(insert);
    db.execute(insert2);
    db.execute(insert3);
  });
  return db.query('contact');
}

@override
Widget build(BuildContext context) {
  return FutureBuilder(
      future: _buscar(),
      builder: (context, futuro) {
        if (futuro.hasData) {
          var lista = futuro.data!;
          return Scaffold(
            appBar: AppBar(
              title: const Text('Lista de contatos'),
              backgroundColor: const Color.fromRGBO(
                  0, 0, 200, 100), //eu fiz isso daq sozinho :D
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(MyApp.CONTACT_FORM);
                    },
                    icon: const Icon(Icons.add))
              ],
            ),
            body: ListView.builder(
              itemCount: lista.length,
              itemBuilder: (context, i) {
                var contato = lista[i];
                var avatar = CircleAvatar(
                  backgroundImage: NetworkImage(contato['avatar']!),
                );
                return ListTile(
                  leading: avatar,
                  title: Text(contato['nome']!),
                  subtitle: Text(contato['telefone']!),
                  trailing: Container(
                    width: 100,
                    child: const Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: null,
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: null,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
        return Scaffold();
      });
}
