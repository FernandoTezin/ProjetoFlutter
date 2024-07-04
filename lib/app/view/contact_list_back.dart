import 'package:agenda_flutter/app/app.dart';
import 'package:agenda_flutter/app/domain/entities/contact.dart';
import 'package:agenda_flutter/app/domain/services/contact_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'contact_list_back.g.dart';

class ContactListBack = _ContactListBack with _$ContactListBack;

abstract class _ContactListBack with Store {
  var _service = GetIt.I.get<ContactService>();

  @observable
  Future<List<Contact>>? list;

  @action
  refreshList([dynamic value]) {
    list = _service.find();
  }

  _ContactListBack() {
    refreshList();
  }

  goToDetails(BuildContext context) {
    Navigator.of(context).pushNamed(App.contact_details);
  }

  goToForm(BuildContext context, [Contact? contact]) {
    Navigator.of(context)
        .pushNamed(App.contactForm, arguments: contact)
        .then(refreshList);
  }

  remove(int id) {
    _service.deleteContact(id);
    refreshList();
  }
}
