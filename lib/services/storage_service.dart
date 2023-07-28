import 'dart:convert';

import 'package:calorietracker/app/dependency_injection.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const _androidOptions = AndroidOptions(encryptedSharedPreferences: true);
const _iosOptions = IOSOptions(
  accessibility: KeychainAccessibility.first_unlock,
);
const selectedUserIdKey = 'selectedUserId';
const usersKey = 'users';

class StorageService {
  Future<String?> get({required String key}) => locator<FlutterSecureStorage>().read(
        key: key,
        aOptions: _androidOptions,
        iOptions: _iosOptions,
      );

  Future<void> save({required String key, required String value}) => locator<FlutterSecureStorage>().write(
        key: key,
        value: value,
        aOptions: _androidOptions,
        iOptions: _iosOptions,
      );

  Future<void> saveObject<T>({required String key, required T object, required Map<String, dynamic> Function(T) toJson}) async {
    final jsonString = json.encode(toJson(object));
    await save(key: key, value: jsonString);
  }

  Future<T?> getObject<T>({required String key, required T Function(Map<String, dynamic>) fromJson}) async {
    final jsonString = await get(key: key);
    if (jsonString == null) return null;

    final Map<String, dynamic> jsonData = json.decode(jsonString);
    return fromJson(jsonData);
  }

  List<T> _listFromJson<T>({required List<dynamic> jsonList, required T Function(Map<String, dynamic>) fromJson}) =>
      jsonList.map((jsonObject) => fromJson(jsonObject)).toList();

  List<Map<String, dynamic>> _listToJson<T>({required List<T> list, required Map<String, dynamic> Function(T) toJson}) =>
      list.map((object) => toJson(object)).toList();

  Future<void> saveList<T>({required String key, required List<T> list, required Map<String, dynamic> Function(T) toJson}) async {
    final jsonList = _listToJson(list: list, toJson: toJson);
    final jsonString = json.encode(jsonList);
    await save(key: key, value: jsonString);
  }

  Future<List<T>> getList<T>({required String key, required T Function(Map<String, dynamic>) fromJson}) async {
    final jsonString = await get(key: key);
    if (jsonString == null) return [];

    final List<dynamic> jsonList = json.decode(jsonString);
    return _listFromJson(jsonList: jsonList, fromJson: fromJson);
  }
}
