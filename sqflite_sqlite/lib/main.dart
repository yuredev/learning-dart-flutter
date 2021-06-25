import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sqfite_database/screens/home_page.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        accentColor: Colors.amber,
      ),
      routes: {
        '/': (ctx) => HomePage(),
      },
    );
  }
}
