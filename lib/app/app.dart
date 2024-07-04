import 'package:flutter/material.dart';
import 'view/contact_list.dart';
import 'view/contact_form.dart';

class App extends StatelessWidget {
  const App({super.key});

  static const home = '/';
  static const contactForm = 'contact_form';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Curso',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      routes: {
        home: (context) => ContactList(),
        contactForm: (context) => ContactForm(),
      },
    );
  }
}
