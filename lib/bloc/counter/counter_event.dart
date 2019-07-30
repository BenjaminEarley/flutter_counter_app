abstract class CounterEvent {
  static const increment = const Increment();
}

class Increment implements CounterEvent {
  const Increment();
}
