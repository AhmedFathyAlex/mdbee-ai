import 'dart:async';
import 'dart:convert';
import 'package:mdbee_ai/core/service/local/interface/i_simple_user_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SimpleLocalData implements ISimpleUserData {
  const SimpleLocalData();

  Future<SharedPreferences> get _pref async =>
      await SharedPreferences.getInstance();

  @override
  FutureOr<bool> delete(String key) async {
    final sharedPreference = await _pref;
    return sharedPreference.remove(key);
  }

  @override
  Future<String?> readString(String key) async {
    final sharedPreference = await _pref;
    return sharedPreference.getString(key);
  }

  @override
  Future<int?> readInt(String key) async {
    final sharedPreference = await _pref;
    return sharedPreference.getInt(key);
  }

  @override
  Future<bool?> readBool(String key) async {
    final sharedPreference = await _pref;
    return sharedPreference.getBool(key);
  }

  @override
  FutureOr<bool> writeBool(String key, bool value) async {
    final sharedPreference = await _pref;
    return sharedPreference.setBool(key, value);
  }

  @override
  FutureOr<bool> writeInt(String key, int value) async {
    final sharedPreference = await _pref;
    return sharedPreference.setInt(key, value);
  }

  @override
  FutureOr<bool> writeString(String key, String value) async {
    final sharedPreference = await _pref;
    return sharedPreference.setString(key, value);
  }

  @override
  Future<bool> containKey(String key) async {
    final sharedPreference = await _pref;
    return sharedPreference.containsKey(key);
  }
}
