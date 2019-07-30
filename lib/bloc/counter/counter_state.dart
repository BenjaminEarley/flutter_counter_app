import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
  final int count;
  final bool isWorking;

  CounterState(this.count, this.isWorking) : super([count, isWorking]);

  CounterState increment() {
    return CounterState(count + 1, isWorking);
  }

  CounterState setIsWorking(bool _isWorking) {
    return CounterState(count, _isWorking);
  }
}
