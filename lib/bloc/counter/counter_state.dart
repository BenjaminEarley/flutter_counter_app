import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
  final int count;
  final bool isWorking;

  CounterState(this.count, this.isWorking) : super([count, isWorking]);

  CounterState copy({int count = null, bool isWorking = null}) => CounterState(
        count = count ?? this.count,
        isWorking = isWorking ?? this.isWorking,
      );
}
