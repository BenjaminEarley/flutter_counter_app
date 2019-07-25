import 'package:rxdart/rxdart.dart';
import 'package:state_playground/data/Counter.dart';

import 'ICounterModel.dart';

class CounterModel implements ICounterModel {
  final _counter = BehaviorSubject.seeded(Counter(0));

  void increment() {
    _counter.add(_counter.value.increment());
  }

  Observable<Counter> getCount() {
    return _counter;
  }
}
