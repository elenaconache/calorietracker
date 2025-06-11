import 'dart:async';
import 'dart:io';

import 'package:calorietracker/feature/auth/data/auth_error.dart';
import 'package:calorietracker/shared/data/model/user.dart';
import 'package:calorietracker/shared/data/service/api/user_api_service.dart';
import 'package:calorietracker/shared/data/service/logging_service.dart';
import 'package:calorietracker/shared/data/service/secure_storage_service.dart';
import 'package:calorietracker/shared/extension/dio_extensions.dart';
import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@lazySingleton
class AuthRepository {
  final BehaviorSubject<User?> _selectedUserController;
  final SecureStorageService _secureStorageService;
  final LoggingService _loggingService;
  final UserApiService _userApiService;

  AuthRepository(
    this._secureStorageService,
    this._loggingService,
    this._selectedUserController,
    this._userApiService,
  );

  Future<void> logOut({required String username}) async {
    final updatedUsers = await fetchUsers();
    updatedUsers.removeWhere((user) => user.username == username);

    if (updatedUsers.isEmpty) {
      await _secureStorageService.delete(key: usersKey);
      if (selectedUser?.username == username) {
        await selectUser(username: null);
      }
    } else {
      await _secureStorageService.saveList(key: usersKey, list: updatedUsers, toJson: (user) => user.toJson());
      if (selectedUser?.username == username) {
        final updatedSelection = updatedUsers.first;
        await selectUser(username: updatedSelection.username);
      }
    }
  }

  Future<List<User>> fetchUsers() => _secureStorageService.getList(
      key: usersKey,
      fromJson: (json) => User.fromJson(json),
    );

  void dispose() => _selectedUserController.close();

  Future<bool> isUserAlreadySaved({required String username}) async {
    final storedUsers = await _secureStorageService.getList<User>(
      key: usersKey,
      fromJson: (userJson) => User.fromJson(userJson),
    );
    return storedUsers.any((user) => user.username == username);
  }

  Future<void> login({required String username}) async {
    if (await isUserAlreadySaved(username: username)) {
      _loggingService.info('Already logged in as $username');
      await selectUser(username: username);
    } else {
      await _userApiService.getUserId(username: username).then((user) async {
        if (user.username.isNotEmpty) {
          await saveUser(username: user.username);
        } else {
          throw Exception(AuthError.unknown);
        }
      }).catchError((error, stackTrace) {
        final AuthError loginError;
        _loggingService.handle(error, stackTrace);
        if (error is DioException) {
          if (error.isConnectionError) {
            loginError = AuthError.connection;
          } else if (error.response?.statusCode == HttpStatus.notFound) {
            loginError = AuthError.notFound;
          } else {
            loginError = AuthError.unknown;
          }
          throw Exception(loginError);
        } else {
          throw Exception(AuthError.unknown);
        }
      });
    }
  }

  Future<void> saveUser({required String username}) async {
    await _secureStorageService.save(key: selectedUserKey, value: username).catchError((error, stackTrace) {
      _loggingService.handle(error, stackTrace);
    });
    var storedUsers = await fetchUsers();
    if (storedUsers.any((user) => user.username == username)) {
      _loggingService.info('Skipping saving username as it was already stored.');
    } else {
      storedUsers.add(User(username: username));
      await _secureStorageService.saveList(
        key: usersKey,
        list: storedUsers,
        toJson: (user) => user.toJson(),
      );
    }
    await selectUser(username: username);
  }

  Future<void> fetchLoggedInState() async {
    final username = await _secureStorageService.get(key: selectedUserKey);
    if (username != null) {
      final users = await _secureStorageService.getList(
        key: usersKey,
        fromJson: (json) => User.fromJson(json),
      );

      final username = await _secureStorageService.get(key: selectedUserKey);
      final selectedUser = users.firstWhereOrNull((element) => element.username == username);
      _selectedUserController.add(selectedUser);
    } else {
      _selectedUserController.add(null);
    }
  }

  Stream<User?> get selectedUserStream async* {
    if (!_selectedUserController.hasValue) {
      await fetchLoggedInState();
    }
    yield* _selectedUserController.stream;
  }

  Future<void> selectUser({String? username}) async {
    final users = await fetchUsers();
    final selection = users.firstWhereOrNull((element) => element.username == username);
    _selectedUserController.add(selection);

    if (selection != null) {
      if (username == null) {
        await _secureStorageService.delete(key: selectedUserKey);
      } else {
        await _secureStorageService.save(key: selectedUserKey, value: username);
      }
    }
  }

  User? get selectedUser => _selectedUserController.valueOrNull;
}
