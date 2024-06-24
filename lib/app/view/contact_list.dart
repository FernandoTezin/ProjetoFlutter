import '../app.dart';
import 'package:flutter/material.dart';
import '../database/dao/contact_dao_impl.dart';
import '../domain/entities/contact.dart';

class ContactList extends StatelessWidget {
  const ContactList({super.key});

  Future<List<Contact>> _findContact() async {
    return ContactDAOImpl().getContact();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _findContact(),
      builder: (context, future) {
        if (future.hasData) {
          List<Contact> list = future.data!;
          return Scaffold(
            appBar: AppBar(
              title: const Text('Lista de Contato'),
              actions: [
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    Navigator.of(context).pushNamed(App.contactForm);
                  },
                )
              ],
            ),
            body: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, i) {
                var contact = list[i];
                var avatar = CircleAvatar(
                  backgroundImage: NetworkImage(contact.url_avatar),
                );
                return ListTile(
                  leading: avatar,
                  title: Text(contact.nome),
                  subtitle: Text(
                    contact.telefone + '\n' + contact.email,
                  ),
                  trailing: Container(
                    width: 100,
                    child: Row(
                      children: const [
                        IconButton(icon: Icon(Icons.edit), onPressed: null),
                        IconButton(icon: Icon(Icons.delete), onPressed: null),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return Scaffold();
        }
      },
    );
  }
}
