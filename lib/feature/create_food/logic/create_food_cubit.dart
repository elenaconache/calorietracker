import 'dart:async';

import 'package:calorietracker/feature/create_food/domain/created_food.dart';
import 'package:calorietracker/shared/data/helper/async_state.dart';
import 'package:calorietracker/shared/data/model/collection/created_food_response.dart';
import 'package:calorietracker/shared/di/dependency_injection.dart';
import 'package:calorietracker/shared/extension/dio_extensions.dart';
import 'package:calorietracker/feature/create_food/data/food_error.dart';
import 'package:calorietracker/feature/create_food/ui/food_input.dart';
import 'package:calorietracker/shared/data/service/api/collection_api_service.dart';
import 'package:calorietracker/shared/data/service/database/food_service.dart';
import 'package:calorietracker/shared/data/service/logging_service.dart';
import 'package:calorietracker/shared/data/validators/nutrition_validator.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'create_food_state.dart';
part 'create_food_cubit.freezed.dart';

@injectable
class CreateFoodCubit extends Cubit<CreateFoodState> {
  CreateFoodCubit() : super(CreateFoodState(createdFood: AsyncState.initial()));

  bool validateNutrition({required FoodInput foodInput}) {
    final validationError = getIt<NutritionValidator>().validateNutrition(nutritionInput: foodInput);
    emit(state.copyWith(validationError: validationError));
    return validationError == null;
  }

  void hideError() => emit(state.copyWith(validationError: null));

  Future<void> createFood({required FoodInput foodInput}) async {
    emit(state.copyWith(createdFood: AsyncState.loading()));
    int? localId;
    CreatedFoodResponse? createdFood;
    try {
      createdFood = await getIt<CollectionApiService>().createFood(body: foodInput.addFoodRequest);
      final foodService = getIt.get<FoodService>();
      unawaited(foodService.upsertFood(localFood: foodInput.localFood));
    } catch (error, stackTrace) {
      if (error is DioException) {
        if (error.isConnectionError) {
          final foodService = getIt.get<FoodService>();
          localId = await foodService.upsertFood(localFood: foodInput.localFood);
        }
      }
      getIt<LoggingService>().handle(error, stackTrace);
    }
    emit(state.copyWith(
        createdFood: AsyncState.success(CreatedFood(
      localId: localId,
      createdFoodId: createdFood?.id,
    ))));
  }
}
