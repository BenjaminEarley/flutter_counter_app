import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
  final int count;
  final bool isLoading;
  final Exception error;

  CounterState({this.count, this.isLoading, this.error})
      : super([count, isLoading, error]);

  CounterState copy({
    int count,
    bool isLoading,
    Exception error,
  }) =>
      CounterState(
        count: count ?? this.count,
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error,
      );
}
