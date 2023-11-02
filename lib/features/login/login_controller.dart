import 'dart:io';
import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/extensions/dio_extensions.dart';
import 'package:calorietracker/features/login/login_error.dart';
import 'package:calorietracker/features/login/login_state.dart';
import 'package:calorietracker/models/user.dart';
import 'package:calorietracker/services/logging_service.dart';
import 'package:calorietracker/services/secure_storage_service.dart';
import 'package:calorietracker/services/user_api_service.dart';
import 'package:calorietracker/services/user_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class LoginController {
  final ValueNotifier<LoginState> loginState = ValueNotifier(const LoginState());

  void onUsernameChanged({required String username}) =>
      loginState.value = LoginState(isLoading: loginState.value.isLoading, isDisabled: username.isEmpty);

  Future<void> login({
    required String username,
    required Function(LoginError loginError) onError,
    required VoidCallback onSuccess,
  }) async {
    loginState.value = const LoginState(
      isLoading: true,
      isDisabled: true,
    );
    if (await _isUserAlreadySaved(username)) {
      onError(LoginError.alreadyLoggedIn);
    } else {
      final apiService = await locator.getAsync<UserApiService>();
      await apiService.getUserId(username: username).then((user) async {
        if (user.id.isNotEmpty) {
          await _saveUser(user.id, user.username);
          onSuccess();
        } else {
          onError(LoginError.unknown);
        }
      }).catchError((error, stackTrace) {
        final LoginError loginError;
        locator<LoggingService>().handle(error, stackTrace);
        if (error is DioException) {
          if (error.isConnectionError) {
            loginError = LoginError.connection;
          } else if (error.response?.statusCode == HttpStatus.notFound) {
            loginError = LoginError.notFound;
          } else {
            loginError = LoginError.unknown;
          }
          onError(loginError);
        } else {
          onError(LoginError.unknown);
        }
      });
    }
    loginState.value = const LoginState(isLoading: false, isDisabled: false);
  }

  Future<void> _saveUser(String userId, String username) async {
    final storageService = locator<SecureStorageService>();
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

  Future<bool> _isUserAlreadySaved(String username) async {
    final storageService = locator<SecureStorageService>();
    final storedUsers = await storageService.getList<User>(
      key: usersKey,
      fromJson: (userJson) => User.fromJson(userJson),
    );
    return storedUsers.any((user) => user.username == username);
  }
}
