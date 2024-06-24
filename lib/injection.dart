import 'package:agenda_flutter/app/domain/services/contact_service.dart';
import 'package:get_it/get_it.dart';
import 'package:agenda_flutter/app/domain/interfaces/contact_dao.dart';
import 'app/database/dao/contact_dao_impl.dart';

setupInjection() {
  GetIt.I.registerSingleton<ContactDAO>(ContactDAOImpl());
  GetIt.I.registerSingleton<ContactService>(ContactService());
}
