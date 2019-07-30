import 'package:counter/bloc/counter/counter_event.dart';
import 'package:counter/common/bloc_base.dart';
import 'package:rxdart/rxdart.dart';

import 'counter_state.dart';

class CounterBloc implements BlocBase {
  final _counterEventSubject = PublishSubject<CounterEvent>();
  final _counterStateSubject = BehaviorSubject.seeded(defaultState);
  Stream<CounterState> get stream => _counterStateSubject;

  CounterBloc() {
    _counterEventSubject.listen((event) {
      if (event == CounterEvent.increment) {
        _counterStateSubject.add(_counterStateSubject.value.increment());
      }
    });
  }

  void increment() {
    _counterEventSubject.add(CounterEvent.increment);
  }

  @override
  void dispose() {
    _counterEventSubject?.close();
    _counterStateSubject?.close();
  }

  static final defaultState = CounterState(0, false);
}
