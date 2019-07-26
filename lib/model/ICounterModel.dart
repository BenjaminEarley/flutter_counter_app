import 'package:rxdart/rxdart.dart';
import 'package:counter/data/Counter.dart';

abstract class ICounterModel {
  void increment();
  Observable<Counter> getCount();
}
