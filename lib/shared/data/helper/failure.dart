import 'package:calorietracker/feature/auth/data/auth_error.dart';
import 'package:calorietracker/feature/recipes/data/create_recipe_error.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.generalFailure({String? message}) = GeneralFailure;
  const factory Failure.connection({String? message}) = ConnectionFailure;
  const factory Failure.auth({@Default(AuthError.unknown) AuthError type}) = AuthFailure;
  const factory Failure.createRecipe({@Default(CreateRecipeError.unknown) CreateRecipeError type}) = CreateRecipeFailure;
}
