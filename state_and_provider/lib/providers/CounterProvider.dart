import 'package:flutter/material.dart';

class CounterState {
  int _value = 0;

  void increment() {
    this._value++;
  } 
  int get value => _value;
}

class CounterProvider extends InheritedWidget {
  
  final CounterState state = CounterState();

  CounterProvider({Widget child}) : super(child: child);

  static CounterProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterProvider>();
  }
  
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}