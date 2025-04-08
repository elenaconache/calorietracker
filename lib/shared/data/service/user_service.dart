import 'dart:async';

import 'package:calorietracker/shared/di/dependency_injection.dart';
import 'package:calorietracker/shared/data/model/user.dart';
import 'package:calorietracker/shared/data/service/diary_service.dart';
import 'package:calorietracker/shared/data/service/logging_service.dart';
import 'package:calorietracker/shared/data/service/secure_storage_service.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UserService {
  final ValueNotifier<bool> isLoggedIn = ValueNotifier(false);
  final ValueNotifier<User?> selectedUser = ValueNotifier(null);
  final ValueNotifier<List<User>> users = ValueNotifier([]);

  Future<void> fetchLoggedInState() async {
    final storageService = getIt<SecureStorageService>();
    final username = await storageService.get(key: selectedUserKey);
    if (username != null) {
      final users = await storageService.getList(key: usersKey, fromJson: (json) => User.fromJson(json));
      this.users.value = users;
      selectedUser.value = users.firstWhereOrNull((user) => user.username == username);
      isLoggedIn.value = selectedUser.value != null;
    } else {
      isLoggedIn.value = false;
    }
  }

  void selectUser(String username) {
    final selection = users.value.firstWhereOrNull((user) => user.username == username);
    if (selection == null) {
      getIt<LoggingService>().info('Could not select user with id $username. There is no user stored locally with the given id.');
    } else {
      selectedUser.value = selection;
      unawaited(getIt<SecureStorageService>().save(key: selectedUserKey, value: username));
      unawaited(fetchUserData());
    }
  }

  Future<void> fetchUserData() async => await getIt<DiaryService>().fetchDiary();

  void logout({required String username}) {
    final updatedUsers = List<User>.from(users.value);
    updatedUsers.removeWhere((user) => user.username == username);
    users.value = updatedUsers;
    final storageService = getIt<SecureStorageService>();
    if (users.value.isEmpty) {
      unawaited(storageService.delete(key: usersKey));
    } else {
      unawaited(storageService.saveList(key: usersKey, list: users.value, toJson: (user) => user.toJson()));
    }
    if (selectedUser.value?.username == username) {
      if (users.value.isEmpty) {
        unawaited(storageService.delete(key: selectedUserKey));
        selectedUser.value = null;
      } else {
        final updatedSelection = users.value.first;
        selectUser(updatedSelection.username);
      }
    }
  }
}
