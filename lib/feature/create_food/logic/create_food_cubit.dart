import 'dart:async';

import 'package:calorietracker/feature/create_food/domain/created_food.dart';
import 'package:calorietracker/shared/data/helper/async_state.dart';
import 'package:calorietracker/shared/di/dependency_injection.dart';
import 'package:calorietracker/feature/create_food/domain/food_error.dart';
import 'package:calorietracker/feature/create_food/ui/food_input.dart';
import 'package:calorietracker/shared/data/service/database/food_service.dart';
import 'package:calorietracker/shared/data/validators/nutrition_validator.dart';
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

    final foodService = getIt.get<FoodService>();
    final localId = await foodService.upsertFood(localFood: foodInput.localFood);

    emit(
      state.copyWith(createdFood: AsyncState.success(CreatedFood(localId: localId))),
    );
  }
}
