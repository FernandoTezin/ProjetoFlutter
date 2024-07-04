import 'package:agenda_flutter/app/view/contact_form_back.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ContactForm extends StatelessWidget {
  ContactForm({super.key});

  final _form = GlobalKey<FormState>();

  Widget fieldName(ContactFormBack back) {
    return TextFormField(
      validator: back.validateName,
      onSaved: (value) => back.contact!.nome = value,
      initialValue: back.contact!.nome,
      decoration: const InputDecoration(labelText: 'Nome'),
    );
  }

  Widget fieldEmail(ContactFormBack back) {
    return TextFormField(
      validator: back.validateEmail,
      onSaved: (value) => back.contact!.email = value,
      initialValue: back.contact!.email,
      decoration: const InputDecoration(labelText: 'Email'),
    );
  }

  Widget fieldPhone(ContactFormBack back) {
    var mask = MaskTextInputFormatter(mask: '(##) #####-####');
    return TextFormField(
      validator: back.validatePhone,
      onSaved: (value) => back.contact!.telefone = value,
      initialValue: back.contact!.telefone,
      inputFormatters: [mask],
      keyboardType: TextInputType.phone,
      decoration: const InputDecoration(
          labelText: 'Telefone', hintText: '(99) 9 9999-9999'),
    );
  }

  Widget fieldUrlAvatar(ContactFormBack back) {
    return TextFormField(
      onSaved: (value) => back.contact!.url_avatar = value,
      initialValue: back.contact!.url_avatar,
      decoration: const InputDecoration(labelText: 'URL do Avatar'),
    );
  }

  @override
  Widget build(BuildContext context) {
    var _back = ContactFormBack(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Contato'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              _form.currentState!.validate();
              _form.currentState!.save();
              if (_back.isValid) {
                _back.saveContact();
                Navigator.of(context).pop();
              }
            },
          )
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _form,
            child: Column(
              children: [
                fieldName(_back),
                fieldEmail(_back),
                fieldPhone(_back),
                fieldUrlAvatar(_back),
              ],
            ),
          )),
    );
  }
}
