import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

abstract class AppDatabase {
  void save(String key, dynamic value);
  dynamic read(String key);
  bool exists(String key);
  void remove(String key);
}

class SharedPrefsDB implements AppDatabase {
  final SharedPreferences prefs ;

  SharedPrefsDB(this.prefs);


  @override
  bool exists(String key) {
    return prefs.containsKey(key);
  }

  @override
  read(String key) {
    if (prefs.containsKey(key)) {
      var data = json.decode(prefs.getString(key)!);
      return data;
    }
    return null;
  }

  @override
  void remove(String key) {
    prefs.remove(key);
  }

  @override
  void save(String key, value) {
    prefs.setString(key, jsonEncode(value));
  }
}
