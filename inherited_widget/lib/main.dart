import 'package:flutter/material.dart';
import 'package:state_and_provider/providers/CounterProvider.dart';

main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Working with State and Provider'),
      ),
      body: Column(
        children: [
          Text('${CounterProvider.of(context).state.value}'),
          RaisedButton(
            child: Icon(Icons.add),
            onPressed: () {
              setState(() {
                CounterProvider.of(context).state.increment();
                // context.dependOnInheritedWidgetOfExactType<CounterProvider>().state.increment();
              });
            },
          ),
        ],
      ),
    );
  }
}
