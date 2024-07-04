import 'package:agenda_flutter/app/domain/entities/contact.dart';
import 'package:agenda_flutter/app/domain/services/contact_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ContactFormBack {
  Contact? contact;
  final _service = GetIt.I.get<ContactService>();

  bool _nameIsValid = false;
  bool _emailIsValid = false;
  bool _phoneIsValid = false;

  bool get isValid => _nameIsValid && _emailIsValid && _phoneIsValid;

  ContactFormBack(BuildContext context) {
    var parameter = ModalRoute.of(context)!.settings.arguments;
    contact = (parameter == null) ? Contact() : parameter as Contact;
  }

  saveContact() async {
    await _service.saveContact(contact!);
  }

  String? validateName(String? name) {
    try {
      _service.validarNome(name!);
      _nameIsValid = true;
      return null;
    } catch (e) {
      _nameIsValid = false;
      return e.toString();
    }
  }

  String? validateEmail(String? email) {
    try {
      _service.validarEmail(email!);
      _emailIsValid = true;
      return null;
    } catch (e) {
      _emailIsValid = false;
      return e.toString();
    }
  }

  String? validatePhone(String? phone) {
    try {
      _service.validarTelefone(phone!);
      _phoneIsValid = true;
      return null;
    } catch (e) {
      _phoneIsValid = false;
      return e.toString();
    }
  }
}
