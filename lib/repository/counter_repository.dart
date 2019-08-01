import 'package:shared_preferences/shared_preferences.dart';

class CounterRepository {
  SharedPreferences prefs;

  static const _key = "counter";

  Future<int> get() async {
    if (prefs == null) {
      prefs = await SharedPreferences.getInstance();
    }
    return prefs.getInt(_key) ?? 0;
  }

  Future<bool> set(int value) async {
    if (prefs == null) {
      prefs = await SharedPreferences.getInstance();
    }
    return prefs.setInt(_key, value);
  }
}


