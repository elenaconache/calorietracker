import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/models/helpers/future_response.dart';
import 'package:calorietracker/models/user_goals.dart';
import 'package:calorietracker/services/secure_storage_service.dart';
import 'package:calorietracker/services/user_service.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';

class UserGoalsController{
  final ValueNotifier<FutureResponse<UserGoals>> userGoals = ValueNotifier(FutureLoading());
  UserGoals? savedUserGoals;

  Future<void> fetchStoredUserGoals() async {
    final storageService = locator<SecureStorageService>();
    final currentUser = locator<UserService>().selectedUser.value?.username;
    if(currentUser == null){
      userGoals.value = FutureError();
    }else{
      final storedGoals = await storageService.getList(key: usersGoalsKey, fromJson: UserGoals.fromJson);
      savedUserGoals = storedGoals.firstWhereOrNull((goals) => goals.username == currentUser) ?? UserGoals(username: currentUser);
      userGoals.value = FutureSuccess(data: savedUserGoals!);
    }
  }

  int? get carbsGramsGoal {
    if(userGoals.value is! FutureSuccess<UserGoals>){
      return null;
    }
    final goals = (userGoals.value as FutureSuccess<UserGoals>).data;
    return goals.calories * goals.carbsPercentage / 100 ~/ 4;
  }

  int? get proteinGramsGoal {
    if(userGoals.value is! FutureSuccess<UserGoals>){
      return null;
    }
    final goals = (userGoals.value as FutureSuccess<UserGoals>).data;
    return goals.calories * goals.proteinPercentage / 100 ~/ 4;
  }

  int? get fatGramsGoal {
    if(userGoals.value is! FutureSuccess<UserGoals>){
      return null;
    }
    final goals = (userGoals.value as FutureSuccess<UserGoals>).data;
    return goals.calories * goals.fatPercentage / 100 ~/ 4;
  }

  void onCaloriesGoalChanged({required int calories}){
    if(userGoals.value is! FutureSuccess<UserGoals>){
      userGoals.value = FutureError();
    }else{
      userGoals.value = FutureSuccess(
        data: (userGoals.value as FutureSuccess<UserGoals>).data.copyWith(calories: calories),
      );
    }

  }
}