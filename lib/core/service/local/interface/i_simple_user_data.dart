import 'dart:async';

abstract class ISimpleUserData {

  Future<bool> containKey(String key);

  Future<String?> readString(String key);

  Future<int?> readInt(String key);

  Future<bool?> readBool(String key);

  FutureOr<bool> writeString(String key, String value);

  FutureOr<bool> writeInt(String key, int value);

  FutureOr<bool> writeBool(String key, bool value);

  FutureOr<bool> delete(String key);
}
