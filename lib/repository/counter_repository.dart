import 'package:shared_preferences/shared_preferences.dart';

class CounterRepository {

  static const _key = "counter";

  Future<int> get() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_key) ?? 0;
  }

  Future<bool> set(int value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setInt(_key, value);
  }
}
