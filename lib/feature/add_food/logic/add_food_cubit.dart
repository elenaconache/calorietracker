import 'dart:async';
import 'dart:io';
import 'package:calorietracker/shared/di/dependency_injection.dart';
import 'package:calorietracker/shared/extension/dio_extensions.dart';
import 'package:calorietracker/feature/add_food/data/food_log.dart';
import 'package:calorietracker/shared/data/model/collection/create_food_errors_response.dart';
import 'package:calorietracker/shared/data/model/food.dart';
import 'package:calorietracker/shared/data/model/meal.dart';
import 'package:calorietracker/shared/data/model/nutrition.dart';
import 'package:calorietracker/shared/data/service/api/collection_api_service.dart';
import 'package:calorietracker/shared/data/service/database/diary_logging_service.dart';
import 'package:calorietracker/shared/data/service/database/food_service.dart';
import 'package:calorietracker/shared/data/service/diary_service.dart';
import 'package:calorietracker/shared/data/service/logging_service.dart';
import 'package:calorietracker/shared/data/service/user_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'add_food_state.dart';
part 'add_food_cubit.freezed.dart';

@injectable
class AddFoodCubit extends Cubit<AddFoodState> {
  AddFoodCubit()
      : super(AddFoodState(
          selectedMeal: null,
          isLoading: false,
          nutrition: Nutrition(),
          servingSize: null,
        ));

  void selectMeal({required Meal? meal}) {
    emit(state.copyWith(selectedMeal: meal));
  }

  void initializeNutrients({required Nutrition nutrition}) {
    emit(state.copyWith(nutrition: nutrition));
  }

  Nutrition get nutritionPerServing => Nutrition.perServing(
        nutritionPer100Grams: state.nutrition,
        servingSizeGrams: state.servingSize ?? 100,
      );

  void recalculateNutrition({required String servingSizeGrams}) {
    final serving = double.tryParse(servingSizeGrams.replaceAll(',', '.')) ?? 100;
    emit(state.copyWith(
      servingSize: serving,
    ));
  }

  Future<void> logFood({
    required FoodLog foodLog,
    int? remoteDiaryEntryId,
    int? localDiaryEntryId,
    Meal? initialMeal,
  }) async {
    emit(state.copyWith(isLoading: true));
    final username = getIt<UserService>().selectedUser.value?.username;
    if (username?.isEmpty ?? true) {
      getIt<LoggingService>().info('Could not log food. Missing username.');
      // TODO: navigate to login screen and show a snack bar saying the session expired
    } else {
      final updatesExistingLog = [remoteDiaryEntryId, localDiaryEntryId].any((id) => id != null);
      showLoading();

      // TODO: API call to update entry; on error, call remove and create locally
      if (updatesExistingLog) {
        await getIt<DiaryService>().removeSingleDiaryEntry(meal: foodLog.meal, collectionId: remoteDiaryEntryId, localId: localDiaryEntryId);
      }

      if (foodLog.localFoodId != null) {
        await getIt<DiaryLoggingService>().saveDiaryEntryLocally(foodLog, username);
      } else {
        await _saveRemotely(username!, foodLog);
      }
      hideLoading();
    }
  }

  Future<void> _saveRemotely(String userId, FoodLog foodLog) async {
    int? remoteFoodId;
    int? localFoodId;
    if (foodLog.food.id == null) {
      final createdFoodId = await (createFood(food: foodLog.food).then((createdFood) {
        unawaited(_saveFoodLocally(foodLog, userId));
        return createdFood;
      }).catchError((error, stackTrace) async {
        if (error is DioException && error.isConnectionError) {
          localFoodId = await _saveFoodLocally(foodLog, userId);
        } else {
          getIt<LoggingService>().handle(error, stackTrace);
          hideLoading();
          throw error;
        }
        return null;
      }));
      remoteFoodId = createdFoodId;
    } else {
      remoteFoodId = foodLog.food.id;
    }
    await getIt<DiaryLoggingService>().createDiaryEntry(
      remoteFoodId: remoteFoodId,
      username: userId,
      foodLog: foodLog,
      localFoodId: localFoodId,
    );
  }

  Future<int?> createFood({required Food food}) async {
    emit(state.copyWith(isLoading: true));
    final collectionApiService = await getIt.getAsync<CollectionApiService>();
    return collectionApiService.createFood(body: food.addFoodRequest).then((createdFood) => createdFood?.id).catchError((error, stackTrace) {
      if (error is DioException && error.response?.statusCode == HttpStatus.conflict) {
        final errorsResponse = CreateFoodErrorsResponse.fromJson(error.response?.data);
        return errorsResponse.errors.firstOrNull?.resource.id;
      } else {
        getIt<LoggingService>().handle(error, stackTrace);
        return null;
      }
    });
  }

  Future<int?> _saveFoodLocally(FoodLog foodLog, String userId) async {
    final foodService = getIt.get<FoodService>();
    final localFoodId = await foodService.upsertFood(localFood: foodLog.food.localFood);
    if (localFoodId == null) {
      getIt<LoggingService>().info('Could not save food locally: ${foodLog.food}');
      emit(state.copyWith(isLoading: false));
      throw Exception('Could not save food locally. Food: ${foodLog.food}.');
    }
    return localFoodId;
  }

  void showLoading() => emit(state.copyWith(isLoading: true));

  void hideLoading() => emit(state.copyWith(isLoading: false));
}
