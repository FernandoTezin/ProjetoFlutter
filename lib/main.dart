import 'package:agenda_flutter/injection.dart';
import 'package:flutter/material.dart';
import 'app/app.dart';

void main() {
  setupInjection();
  runApp(const App());
}
