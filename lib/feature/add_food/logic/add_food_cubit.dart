import 'dart:async';
import 'dart:io';
import 'package:calorietracker/feature/auth/domain/auth_repository.dart';
import 'package:calorietracker/feature/add_food/data/food_log.dart';
import 'package:calorietracker/shared/data/model/collection/create_food_errors_response.dart';
import 'package:calorietracker/shared/data/model/food.dart';
import 'package:calorietracker/shared/data/model/meal.dart';
import 'package:calorietracker/shared/data/model/nutrition.dart';
import 'package:calorietracker/shared/data/service/api/collection_api_service.dart';
import 'package:calorietracker/shared/data/service/database/diary_logging_service.dart';
import 'package:calorietracker/shared/data/service/logging_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'add_food_state.dart';
part 'add_food_cubit.freezed.dart';

@injectable
class AddFoodCubit extends Cubit<AddFoodState> {
  final AuthRepository _authRepository;
  final LoggingService _loggingService;
  final DiaryLoggingService _diaryLoggingService;
  final CollectionApiService _collectionApiService;

  AddFoodCubit(
    this._authRepository,
    this._loggingService,
    this._diaryLoggingService,
    this._collectionApiService,
  ) : super(AddFoodState(
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
    emit(state.copyWith(servingSize: serving));
  }

  Future<void> logFood({
    required FoodLog foodLog,
    int? remoteDiaryEntryId,
    int? localDiaryEntryId,
    Meal? initialMeal,
  }) async {
    emit(state.copyWith(isLoading: true));
    final selectedUser = _authRepository.selectedUser;
    if (selectedUser == null) {
      _loggingService.info('Could not log food. Missing username.');
      // TODO: navigate to login screen and show a snack bar saying the session expired
    } else {
      showLoading();
      if (localDiaryEntryId != null) {
        await _diaryLoggingService.updateDiaryEntryLocally(localId: localDiaryEntryId, foodLog: foodLog, username: selectedUser.username);
      } else {
        await _diaryLoggingService.saveDiaryEntryLocally( foodLog,  selectedUser.username);
      }

      hideLoading();
    }
  }

  Future<int?> createFood({required Food food}) async {
    emit(state.copyWith(isLoading: true));
    return _collectionApiService.createFood(body: food.addFoodRequest).then((createdFood) => createdFood?.id).catchError((error, stackTrace) {
      if (error is DioException && error.response?.statusCode == HttpStatus.conflict) {
        final errorsResponse = CreateFoodErrorsResponse.fromJson(error.response?.data);
        return errorsResponse.errors.firstOrNull?.resource.id;
      } else {
        _loggingService.handle(error, stackTrace);
        return null;
      }
    });
  }

  void showLoading() => emit(state.copyWith(isLoading: true));

  void hideLoading() => emit(state.copyWith(isLoading: false));
}
