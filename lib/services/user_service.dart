import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/services/storage_service.dart';
import 'package:flutter/cupertino.dart';

class UserService {
  final ValueNotifier<bool> isLoggedIn = ValueNotifier(false);

  Future<void> fetchLoggedInState() async {
    final userId = await locator<StorageService>().get(key: selectedUserIdKey);
    isLoggedIn.value = userId != null;
  }
}
