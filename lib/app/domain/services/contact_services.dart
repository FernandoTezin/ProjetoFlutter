import 'package:flut2/app/domain/entities/contact.dart';
import 'package:flut2/app/domain/exceptions/domain_layer_exception.dart';
import 'package:flut2/app/domain/interfaces/contact_dao.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ContactService {
  var _dao = GetIt.I.get<ContactDao>();

  save(Contact contact) {
    _dao.save(contact);
    validateName(contact.nome);
    validateEmail(contact.email);
    validatePhone(contact.telefone);
  }

  remove(int id) {
    _dao.remove(id);
  }

  Future<List<Contact>> find() {
    return _dao.find();
  }
}

validateName(String name) {
  var min = 3;
  var max = 50;

  if (name == null) {
    throw new DomainLayerException('o nome é obrigatório.');
  } else if (name.length < min) {
    throw new DomainLayerException(
        'o nome deve possuir pelo menos $min caracteres.');
  } else if (name.length > max) {
    throw new DomainLayerException(
        'o nome deve possuir no máximo $max caracteres.');
  }
}

validateEmail(String email) {
  if (email == null) {
    throw new DomainLayerException('o email tem que ser obrigatório');
  } else if (!email.contains('@')) {
    throw new DomainLayerException('o email deve possuir @.');
  }
}

validatePhone(String phone) {
  var format = RegExp(r'^\([1-9]{2}\)[9] [6-9]{1}[0-9]{3}\-[0-9]{4}$');
  if (phone == null) {
    throw new DomainLayerException('telefone é obrigatório.');
  } else if (!format.hasMatch(phone)) {
    throw new DomainLayerException(
        'formato inválido. o formato deve ser (99) 9 8888-8888');
  }
}
