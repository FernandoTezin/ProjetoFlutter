import '../entities/contact.dart';

abstract class ContactDAO {
  saveContact(Contact contact);
  deleteContact(int id);
  Future<List<Contact>> getContact();
}
