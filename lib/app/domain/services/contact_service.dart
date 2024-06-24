import 'package:get_it/get_it.dart';

import '../entities/contact.dart';
import '../exception/domain_exception.dart';
import '../interfaces/contact_dao.dart';

class ContactService {
  final _dao = GetIt.I.get<ContactDAO>();

  saveContact(Contact contact) {
    validarNome(contact.nome);
    validarEmail(contact.email);
    validarTelefone(contact.telefone);
    _dao.saveContact(contact);
  }

  deleteContact(int id) {
    _dao.deleteContact(id);
  }

  Future<List<Contact>> find() {
    return _dao.getContact();
  }

  validarNome(String nome) {
    var min = 3;
    var max = 50;

    if (nome == null) {
      throw DomainException('Nome é obrigatório.');
    } else if (nome.length < min) {
      throw DomainException('Nome deve ter pelo menos $min caracteres.');
    } else if (nome.length > max) {
      throw DomainException('Nome deve ter no máximo $max caracteres.');
    }
  }

  validarEmail(String email) {
    if (email == null) {
      throw DomainException('Email é obrigatório.');
    } else if (!email.contains('@')) {
      throw DomainException('Email inválido.');
    }
  }

  validarTelefone(String telefone) {
    var format = RegExp(r'^\([1-9]{2}\) [9]{0,1}[6-9]{1}[0-9]{3}-[0-9]{4}$');
    if (telefone == null) {
      throw DomainException('Telefone é obrigatório.');
    } else if (!format.hasMatch(telefone)) {
      throw DomainException('Telefone inválido.');
    }
  }
}
