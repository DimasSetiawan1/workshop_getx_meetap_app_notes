import 'dart:convert';

import 'package:get_storage/get_storage.dart';

class GetStorageUtils {
  static final GetStorage _getStorage = GetStorage();

  static void save<T>(String key, T value) {
    if (value != null) {
      if (value is String || value is int || value is double || value is bool) {
        _getStorage.write(key, value);
      } else if (value is Map) {
        var encodeRes = jsonEncode(value);
        _getStorage.write(key, encodeRes);
      } else {
        throw Exception(
          'Unsupported type for GetStorage: ${value.runtimeType}',
        );
      }
    } else {
      throw Exception('Value cannot be null for key: $key');
    }
  }

  static T read<T>(String key) {
    var value = _getStorage.read(key);
    if (value != null) {
      if (value is String || value is int || value is double || value is bool) {
        return value;
      } else if (value == Map) {
        return value;
      } else {
        throw Exception(
          'Unsupported type for GetStorage: ${value.runtimeType}',
        );
      }
    } else {
      return '[]' as T;
    }
  }

  static void remove(String key) {
    _getStorage.remove(key);
  }
}
