import 'dart:async';

import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/models/user.dart';
import 'package:calorietracker/services/diary_service.dart';
import 'package:calorietracker/services/logging_service.dart';
import 'package:calorietracker/services/storage_service.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';

class UserService {
  final ValueNotifier<bool> isLoggedIn = ValueNotifier(false);
  final ValueNotifier<User?> selectedUser = ValueNotifier(null);
  final ValueNotifier<List<User>> users = ValueNotifier([]);

  Future<void> fetchLoggedInState() async {
    final storageService = locator<StorageService>();
    final userId = await storageService.get(key: selectedUserIdKey);
    if (userId != null) {
      final users = await storageService.getList(key: usersKey, fromJson: (json) => User.fromJson(json));
      this.users.value = users;
      selectedUser.value = users.firstWhereOrNull((user) => user.id == userId);
      isLoggedIn.value = selectedUser.value != null;
    } else {
      isLoggedIn.value = false;
    }
  }

  void selectUser(String id) {
    final selection = users.value.firstWhereOrNull((user) => user.id == id);
    if (selection == null) {
      locator<LoggingService>().info('Could not select user with id $id. There is no user stored locally with the given id.');
    } else {
      selectedUser.value = selection;
      unawaited(locator<StorageService>().save(key: selectedUserIdKey, value: id));
      unawaited(fetchUserData());
    }
  }

  Future<void> fetchUserData() async => await locator<DiaryService>().fetchDiary();

  void logout({required String userId}) {
    final updatedUsers = List<User>.from(users.value);
    updatedUsers.removeWhere((user) => user.id == userId);
    users.value = updatedUsers;
    final storageService = locator<StorageService>();
    if (users.value.isEmpty) {
      unawaited(storageService.delete(key: usersKey));
    } else {
      unawaited(storageService.saveList(key: usersKey, list: users.value, toJson: (user) => user.toJson()));
    }
    if (selectedUser.value?.id == userId) {
      if (users.value.isEmpty) {
        unawaited(storageService.delete(key: selectedUserIdKey));
        selectedUser.value = null;
      } else {
        final updatedSelection = users.value.first;
        selectUser(updatedSelection.id);
      }
    }
  }
}
