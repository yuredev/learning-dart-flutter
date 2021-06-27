import 'counter_bloc.dart';

void main() {
  final counterBloc = CounterBloc(1);

  counterBloc.stream.listen((state) => print(state));

  counterBloc.add(CounterEvent.INCREMENT); // 2
  counterBloc.add(CounterEvent.DECREMENT); // 1
  counterBloc.add(CounterEvent.INCREMENT); // 2
  counterBloc.add(CounterEvent.DECREMENT); // 1
  counterBloc.add(CounterEvent.DECREMENT); // 0
  counterBloc.add(CounterEvent.INCREMENT); // 1
}