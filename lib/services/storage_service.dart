import 'package:calorietracker/app/dependency_injection.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const _androidOptions = AndroidOptions(encryptedSharedPreferences: true);
const _iosOptions = IOSOptions(
  accessibility: KeychainAccessibility.first_unlock,
);
const userIdKey = 'userId';

class StorageService {
  Future<String?> read({required String key}) => locator<FlutterSecureStorage>().read(
        key: key,
        aOptions: _androidOptions,
        iOptions: _iosOptions,
      );

  Future<void> write({required String key, required String value}) => locator<FlutterSecureStorage>().write(
        key: key,
        value: value,
        aOptions: _androidOptions,
        iOptions: _iosOptions,
      );
}
