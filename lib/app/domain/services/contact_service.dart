import 'package:get_it/get_it.dart';

import '../entities/contact.dart';
import '../exception/domain_exception.dart';
import '../interfaces/contact_dao.dart';

class ContactService {
  final _dao = GetIt.I.get<ContactDAO>();

  saveContact(Contact contact) {
    validarNome(contact.nome!);
    validarEmail(contact.email!);
    validarTelefone(contact.telefone!);
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
    } else {
      return nome;
    }
  }

  validarEmail(String email) {
    if (email == null) {
      throw DomainException('Email é obrigatório.');
    } else if (!email.contains('@')) {
      throw DomainException('Email inválido.');
    } else {
      return email;
    }
  }

  validarTelefone(String telefone) {
    if (telefone == null) {
      throw DomainException('Telefone é obrigatório.');
    } else {
      return telefone;
    }
  }
}
