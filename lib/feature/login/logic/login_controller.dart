import 'dart:io';
import 'package:calorietracker/shared/di/dependency_injection.dart';
import 'package:calorietracker/shared/extension/dio_extensions.dart';
import 'package:calorietracker/feature/login/data/login_error.dart';
import 'package:calorietracker/feature/login/data/login_state.dart';
import 'package:calorietracker/shared/data/model/user.dart';
import 'package:calorietracker/shared/data/service/logging_service.dart';
import 'package:calorietracker/shared/data/service/secure_storage_service.dart';
import 'package:calorietracker/shared/data/service/api/user_api_service.dart';
import 'package:calorietracker/shared/data/service/user_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@injectable
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
      final apiService = await getIt.getAsync<UserApiService>();
      await apiService.getUserId(username: username).then((user) async {
        if (user.username.isNotEmpty) {
          await _saveUser(user.username);
          onSuccess();
        } else {
          onError(LoginError.unknown);
        }
      }).catchError((error, stackTrace) {
        final LoginError loginError;
        getIt<LoggingService>().handle(error, stackTrace);
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

  Future<void> _saveUser(String username) async {
    final storageService = getIt<SecureStorageService>();
    await storageService.save(key: selectedUserKey, value: username).catchError((error, stackTrace) {
      getIt<LoggingService>().handle(error, stackTrace);
    });
    var storedUsers = await storageService.getList<User>(
      key: usersKey,
      fromJson: (userJson) => User.fromJson(userJson),
    );
    if (storedUsers.any((user) => user.username == username)) {
      getIt<LoggingService>().info('Skipping saving username as it was already stored.');
    } else {
      storedUsers.add(User(username: username));
      await storageService.saveList(key: usersKey, list: storedUsers, toJson: (user) => user.toJson());
    }
    await getIt<UserService>().fetchLoggedInState();
  }

  Future<bool> _isUserAlreadySaved(String username) async {
    final storageService = getIt<SecureStorageService>();
    final storedUsers = await storageService.getList<User>(
      key: usersKey,
      fromJson: (userJson) => User.fromJson(userJson),
    );
    return storedUsers.any((user) => user.username == username);
  }
}
