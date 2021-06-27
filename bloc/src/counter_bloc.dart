import 'package:bloc/bloc.dart';

enum CounterEvent {
  INCREMENT,
  DECREMENT,
}

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc(int initialState) : super(initialState);

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.INCREMENT:
        yield state + 1;
        break;
      case CounterEvent.DECREMENT:
        yield state - 1;
        break;
    }
  } 
}

