class Counter {
  int _count;
  Counter(int count) : _count = count;
  int get count => _count;

  Counter increment() {
    return Counter(_count + 1);
  }
}