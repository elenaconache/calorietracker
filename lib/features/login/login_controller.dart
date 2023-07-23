import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/features/login/login_state.dart';
import 'package:calorietracker/service/collection_api_service.dart';
import 'package:calorietracker/service/logging_service.dart';
import 'package:calorietracker/service/storage_service.dart';
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
    await apiService.getUserId(username: username).then((userId) async {
      if (userId.isNotEmpty) {
        await locator<StorageService>().write(key: userIdKey, value: userId).catchError((error, stackTrace) {
          locator<LoggingService>().handle(error, stackTrace);
        });
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
}
