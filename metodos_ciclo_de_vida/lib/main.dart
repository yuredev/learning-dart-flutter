import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
                                                  // mixin: injeta código dentro da classe porém sem herança
class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  final controller = TextEditingController();
  bool boolean = false;

  _MyHomePageState() {
    print('Contructor called');
  }

  // ----- CICLO DE VIDA DO WIDGET --------
  @override
  void initState() {
    super.initState();
    print('initState called');
    // adicionando Observer
    // essa classe observará quando acontecerá eventos
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  didUpdateWidget(Widget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget called');
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose called');
    // removendo Observer
    // não escutar mais eventos
    WidgetsBinding.instance.removeObserver(this);
  }
  // -------------------------------------------------
  // -------- CICLO DE VIDA DA APLICAÇÃO -------------

  // AppLifecycleState.inactive: transição entre estados, onde a aplicação barra entradas do usuário
  // AppLifecycleState.paused: estado onde a aplicação está pausada e rodando em background, acontece quando minizamos o app
  // AppLifecycleState.resumed: acontece quando o app estava minimizado e foi reaberto
  // AppLifecycleState.suspending: acontece quando o app é fechado

  // esse método é chamado quando há uma mudança no estado de ciclo de vida do app
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // printar estado atual do ciclo de vida
    print(state);
  }

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LifeCycleMethods'),
      ),
      body: Container(),
    );
  }
}
