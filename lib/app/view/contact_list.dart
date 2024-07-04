import 'package:agenda_flutter/app/view/contact_list_back.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
import '../domain/entities/contact.dart';

class ContactList extends StatelessWidget {
  ContactList({super.key});

  final _back = ContactListBack();

  CircleAvatar circleAvatar(String url) {
    if (Uri.tryParse(url)!.isAbsolute) {
      return CircleAvatar(backgroundImage: NetworkImage(url));
    } else {
      return CircleAvatar(child: Icon(Icons.person));
    }
  }

  Widget IconEditButton(Function() onPressed) {
    return IconButton(
        icon: Icon(Icons.edit), color: Colors.orange, onPressed: onPressed);
  }

  Widget IconDeleteButton(BuildContext context, Function() remove) {
    return IconButton(
        icon: Icon(Icons.delete),
        color: Colors.red,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                      title: const Text('Excluir'),
                      content: const Text('Confirma a exclusão?'),
                      actions: [
                        TextButton(
                          child: const Text('Não'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: const Text('Sim'),
                          onPressed: remove,
                        )
                      ]));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista de Contato'),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                _back.goToForm(context);
              },
            )
          ],
        ),
        body: Observer(builder: (context) {
          return FutureBuilder(
            future: _back.list,
            builder: (context, future) {
              if (!future.hasData) {
                return CircularProgressIndicator();
              } else {
                List<Contact> list = future.data!;
                return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, i) {
                    var contact = list[i];
                    return ListTile(
                      leading: circleAvatar(contact.url_avatar!),
                      title: Text(contact.nome!),
                      subtitle: Text(
                        contact.telefone! + '\n' + contact.email!,
                      ),
                      trailing: Container(
                        width: 100,
                        child: Row(
                          children: [
                            IconEditButton(() {
                              _back.goToForm(context, contact);
                            }),
                            IconDeleteButton(context, () {
                              _back.remove(contact.id!);
                              Navigator.of(context).pop();
                            })
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            },
          );
        }));
  }
}
