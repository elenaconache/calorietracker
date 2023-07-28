import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/models/user.dart';
import 'package:calorietracker/services/storage_service.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';

class UserService {
  final ValueNotifier<bool> isLoggedIn = ValueNotifier(false);
  final ValueNotifier<User?> selectedUser = ValueNotifier(null);

  Future<void> fetchLoggedInState() async {
    final storageService = locator<StorageService>();
    final userId = await storageService.get(key: selectedUserIdKey);
    if (userId != null) {
      final users = await storageService.getList(key: usersKey, fromJson: (json) => User.fromJson(json));
      selectedUser.value = users.firstWhereOrNull((user) => user.id == userId);
      isLoggedIn.value = selectedUser.value != null;
    } else {
      isLoggedIn.value = false;
    }
  }
}
