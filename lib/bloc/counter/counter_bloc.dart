import 'package:counter/bloc/counter/counter_event.dart';
import 'package:counter/common/bloc_base.dart';
import 'package:counter/repository/counter_repository.dart';
import 'package:rxdart/rxdart.dart';

import 'counter_state.dart';

class CounterBloc implements BlocBase {
  final _counterEventSubject = PublishSubject<CounterEvent>();
  final _counterStateSubject = BehaviorSubject.seeded(defaultState);
  Observable<CounterState> get stream => _counterStateSubject.stream;

  CounterBloc(CounterRepository repo) {
    repo.get().then((count) {
      final current = _counterStateSubject.value;
      _counterStateSubject.add(current.copy(
        count: count,
        isLoading: false,
      ));
    });

    _counterEventSubject.listen((event) async {
      final current = _counterStateSubject.value;
      if (event == CounterEvent.Increment) {
        final newCount = current.count + 1;
        _counterStateSubject.add(current.copy(
          count: newCount,
          isLoading: false,
        ));
        repo.set(newCount);
      }
    });
  }

  void increment() {
    _counterEventSubject.add(CounterEvent.Increment);
  }

  @override
  void dispose() {
    _counterEventSubject?.close();
    _counterStateSubject?.close();
  }

  static final defaultState = CounterState(
    count: 0,
    isLoading: true,
  );
}
