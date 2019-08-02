import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
  final int count;
  final bool isLoading;

  CounterState({this.count, this.isLoading})
      : super([count, isLoading]);

  CounterState copy({
    int count,
    bool isLoading,
  }) =>
      CounterState(
        count: count ?? this.count,
        isLoading: isLoading ?? this.isLoading,
      );
}
