import 'package:rxdart/rxdart.dart';
import 'package:state_playground/data/Counter.dart';

abstract class ICounterModel {
  void increment();
  Observable<Counter> getCount();
}
