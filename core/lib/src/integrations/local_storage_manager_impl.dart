import 'package:shared_preferences/shared_preferences.dart';
import 'package:core/src/abstractions/local_storage_manager.dart';

class LocalStorageManagerImpl implements LocalStorageManager {
  Future<SharedPreferences> _sharedPreferencesInstance() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs;
  }

  @override
  Future<bool> saveStringData(String key, String value) async {
    SharedPreferences prefs = await _sharedPreferencesInstance();
    return prefs.setString(key, value);
  }

  @override
  Future<String?> getStringData(String key) async {
    SharedPreferences prefs = await _sharedPreferencesInstance();
    return prefs.getString(key);
  }

  @override
  Future<bool> removeData(String key) async {
    SharedPreferences prefs = await _sharedPreferencesInstance();
    return prefs.remove(key);
  }

  @override
  Future<bool> clearData() async {
    SharedPreferences prefs = await _sharedPreferencesInstance();
    return prefs.clear();
  }

  @override
  Future<bool?> getBool(String key) async {
    SharedPreferences prefs = await _sharedPreferencesInstance();
    return prefs.getBool(key);
  }

  @override
  Future<double?> getDouble(String key) async {
    SharedPreferences prefs = await _sharedPreferencesInstance();
    return prefs.getDouble(key);
  }

  @override
  Future<int?> getInt(String key) async {
    SharedPreferences prefs = await _sharedPreferencesInstance();
    return prefs.getInt(key);
  }

  @override
  Future<List<String>?> getStringListData(String key) async {
    SharedPreferences prefs = await _sharedPreferencesInstance();
    return prefs.getStringList(key);
  }

  @override
  Future<bool> saveBool(String key, bool value) async {
    SharedPreferences prefs = await _sharedPreferencesInstance();
    return prefs.setBool(key, value);
  }

  @override
  Future<bool> saveDouble(String key, double value) async {
    SharedPreferences prefs = await _sharedPreferencesInstance();
    return prefs.setDouble(key, value);
  }

  @override
  Future<bool> saveStringListData(
    String key,
    List<String>? value,
  ) async {
    SharedPreferences prefs = await _sharedPreferencesInstance();
    return prefs.setStringList(key, value!);
  }

  @override
  Future<bool> setInt(String key, int value) async {
    SharedPreferences prefs = await _sharedPreferencesInstance();
    return prefs.setInt(key, value);
  }
}
