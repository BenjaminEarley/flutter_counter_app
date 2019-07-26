import 'package:rxdart/rxdart.dart';
import 'package:counter/data/Counter.dart';

import 'ICounterModel.dart';

class CounterModel implements ICounterModel {
  final _counter = BehaviorSubject.seeded(defaultState);

  void increment() => _counter.add(_counter.value.increment());

  Observable<Counter> getCount() {
    return _counter;
  }

  static final Counter defaultState = Counter(0);
}
