import 'package:calorietracker/feature/recipes/logic/search_recipe_event.dart';
import 'package:calorietracker/shared/data/helper/async_state.dart';
import 'package:calorietracker/shared/data/helper/failure.dart';
import 'package:calorietracker/shared/data/model/local/local_recipe.dart';
import 'package:calorietracker/shared/data/model/recipe.dart';
import 'package:calorietracker/shared/data/service/database/recipe_repository.dart';
import 'package:calorietracker/shared/data/service/logging_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'search_recipe_state.dart';
part 'search_recipe_bloc.freezed.dart';

@injectable
class SearchRecipeBloc extends Bloc<SearchRecipeEvent, SearchRecipeState> {
  final LoggingService _loggingService;
  final RecipeRepository _recipeRepository;

  SearchRecipeBloc(this._loggingService, this._recipeRepository)
    : super(
        SearchRecipeState(
          allRecipes: AsyncState.loading(),
          searchResults: [],
          query: '',
        ),
      ) {
    on<SearchRecipeEvent>((event, emit) async {
      await event.when(
        requestRecipesSubscription: () async => fetchRecipes(emit: emit),
        findRecipe: (query) async => searchRecipe(query: query, emit: emit),
      );
    });
  }

  Future<void> fetchRecipes({required Emitter emit}) async {
    return await emit.forEach(
      _recipeRepository.watchRecipes().map(
        (List<LocalRecipe> localRecipes) =>
            localRecipes.map((local) => Recipe.local(localRecipe: local)),
      ),
      onData: (recipes) {
        final results = recipes
            .where(
              (recipe) => recipe.name.toLowerCase().contains(
                state.query?.toLowerCase() ?? '',
              ),
            )
            .toList();
        final newState = (state.copyWith(
          allRecipes: AsyncState.success(recipes.toList()),
          searchResults: results,
        ));
        return newState;
      },
      onError: (error, stackTrace) {
        _loggingService.handle(error, stackTrace);
        return state.copyWith(
          allRecipes: AsyncState.failure(Failure.generalFailure()),
          searchResults: [],
        );
      },
    );
  }

  void searchRecipe({required String query, required Emitter emit}) async {
    final results =
        state.allRecipes.data?.where((recipe) {
          return recipe.name.toLowerCase().contains(query.toLowerCase());
        }).toList() ??
        [];
    emit(state.copyWith(searchResults: results, query: query));
  }
}
