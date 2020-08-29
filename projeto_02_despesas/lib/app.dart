import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:weekly_expenses/components/home_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp
    // ]);

    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(
        // primaryColor recebe uma cor única
        // primaryColor: Colors.teal,
        // primarySwatch recebe um conjunto de cores
        // recebe um range de cores
        primarySwatch: Colors.teal,
        accentColor: Colors.red[400],
        fontFamily: 'Quicksand',
        // pega o tema padrõa e o modifica colocando os estilos 
        // abaixo 
        textTheme: ThemeData.light().textTheme.copyWith(
          button: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
          headline6: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
            headline6: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}