import 'package:calorietracker/models/helpers/future_response.dart';
import 'package:flutter/cupertino.dart';

class SearchRecipeController {
  final ValueNotifier<FutureInitialState> recipes = ValueNotifier(FutureInitialState());

  Future<void> searchRecipe({required String query}) async {}
}
