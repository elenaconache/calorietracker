import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_recipe_event.freezed.dart';

@freezed
abstract class SearchRecipeEvent with _$SearchRecipeEvent {
  const factory SearchRecipeEvent.requestRecipesSubscription() =
      RequestRecipesSubscriptionEvent;
  const factory SearchRecipeEvent.findRecipe({required String query}) =
      FindRecipeEvent;
}
