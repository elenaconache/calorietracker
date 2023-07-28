import 'dart:convert';

import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/features/login/login_state.dart';
import 'package:calorietracker/models/user.dart';
import 'package:calorietracker/services/collection_api_service.dart';
import 'package:calorietracker/services/logging_service.dart';
import 'package:calorietracker/services/storage_service.dart';
import 'package:calorietracker/services/user_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class LoginController {
  final ValueNotifier<LoginState> loginState = ValueNotifier(const LoginState());

  void onUsernameChanged({required String username}) =>
      loginState.value = LoginState(isLoading: loginState.value.isLoading, isDisabled: username.isEmpty);

  Future<void> login({
    required String username,
    required Function(int? status) onError,
    required VoidCallback onSuccess,
  }) async {
    loginState.value = const LoginState(
      isLoading: true,
      isDisabled: true,
    );
    final apiService = await locator.getAsync<CollectionApiService>();
    await apiService.getUserId(username: username).then((response) async {
      final userId = jsonDecode(response);
      if (userId.isNotEmpty) {
        await _saveUser(userId, username);
        onSuccess();
      } else {
        onError(null);
      }
    }).catchError((error, stackTrace) {
      locator<LoggingService>().handle(error, stackTrace);
      if (error is DioError) {
        onError(error.response?.statusCode);
      } else {
        onError(null);
      }
    });
    loginState.value = const LoginState(isLoading: false, isDisabled: false);
  }

  Future<void> _saveUser(userId, String username) async {
    final storageService = locator<StorageService>();
    await storageService.save(key: selectedUserIdKey, value: userId).catchError((error, stackTrace) {
      locator<LoggingService>().handle(error, stackTrace);
    });
    var storedUsers = await storageService.getList<User>(
      key: usersKey,
      fromJson: (userJson) => User.fromJson(userJson),
    );
    if (storedUsers.any((user) => user.id == userId)) {
      locator<LoggingService>().info('Skipping saving user id as it was already stored.');
    } else {
      storedUsers.add(User(id: userId, username: username));
      await storageService.saveList(key: usersKey, list: storedUsers, toJson: (user) => user.toJson());
    }
    await locator<UserService>().fetchLoggedInState();
  }
}
