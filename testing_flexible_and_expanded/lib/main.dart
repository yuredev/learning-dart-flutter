import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:testing_flexible_and_expanded/screens/FlexibleAndExpanded.dart';
import 'package:testing_flexible_and_expanded/screens/Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return MaterialApp(
      theme: ThemeData(
        backgroundColor: Colors.lightBlue,
        accentColor: Colors.deepOrange

      ),
      title: 'Learning Flutter',
      routes: {
        '/': (ctx) => Home(),
        '/flexible_and_expanded': (ctx) => FlexibleAndExpanded(),
      },
      // home: Scaffold(
      //   appBar: AppBar(
      //     title: Text('App Bar'),
      //   ),
      //   body: Center(
      //     child: Text('Hello'),
      //   ),
      // ),
    );
  }
}
