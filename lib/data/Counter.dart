import 'package:equatable/equatable.dart';

class Counter extends Equatable {
  final int count;

  Counter(this.count) : super([count]);

  Counter increment() {
    return Counter(count + 1);
  }
}
