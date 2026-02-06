import 'package:calorietracker/feature/recipes/data/search_recipe_repository.dart';
import 'package:calorietracker/shared/data/helper/async_state.dart';
import 'package:calorietracker/shared/data/helper/failure.dart';
import 'package:calorietracker/shared/data/model/recipe.dart';
import 'package:calorietracker/shared/data/service/logging_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'search_recipe_state.dart';
part 'search_recipe_cubit.freezed.dart';

@injectable
class SearchRecipeCubit extends Cubit<SearchRecipeState> {
  final SearchRecipeRepository _searchRecipeRepository;
  final LoggingService _loggingService;

  SearchRecipeCubit(this._searchRecipeRepository, this._loggingService)
      : super(SearchRecipeState(
          allRecipes: AsyncState.initial(),
          searchResults: [],
        )) {
    fetchRecipes();
  }

  Future<void> fetchRecipes({bool clearSearchResults = false}) async {
    emit(state.copyWith(allRecipes: AsyncState.loading()));
    try {
      final recipes = await _searchRecipeRepository.fetchRecipes();
      emit(state.copyWith(allRecipes: AsyncState.success(recipes)));
    } catch (e, stackTrace) {
      _loggingService.handle(e, stackTrace);
      emit(state.copyWith(
        allRecipes: AsyncState.failure(Failure.generalFailure()),
        searchResults: clearSearchResults ? [] : state.searchResults,
      ));
    }
  }

  void searchRecipe({required String query}) async {
    final results = state.allRecipes.data?.where(
          (recipe) {
            return recipe.name.toLowerCase().contains(query.toLowerCase());
          },
        ).toList() ??
        [];
    emit(state.copyWith(searchResults: results));
  }

  void clearSearch() => fetchRecipes(clearSearchResults: true);
}
