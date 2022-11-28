abstract class LocalStorageManager {
  Future<bool> saveStringData(String key, String value);
  Future<String?> getStringData(String key);
  Future<List<String>?> getStringListData(String key);
  Future<bool> saveStringListData(String key, List<String>? value);
  Future<bool> removeData(String key);
  Future<bool> clearData();
  Future<bool> saveBool(String key, bool value);
  Future<bool?> getBool(String key);
  Future<bool> setInt(String key, int value);
  Future<int?> getInt(String key);
  Future<bool> saveDouble(String key, double value);
  Future<double?> getDouble(String key);
}
