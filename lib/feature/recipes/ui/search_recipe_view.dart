import 'dart:async';

import 'package:calorietracker/feature/recipes/logic/search_recipe_cubit.dart';
import 'package:calorietracker/shared/data/helper/async_state.dart';
import 'package:calorietracker/feature/recipes/ui/recipe_item.dart';
import 'package:calorietracker/shared/navigation/routes.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:calorietracker/ui/components/app_divider.dart';
import 'package:calorietracker/ui/components/empty_view.dart';
import 'package:calorietracker/ui/components/general_error_view.dart';
import 'package:calorietracker/ui/components/text_field/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchRecipeView extends StatefulWidget {
  const SearchRecipeView({super.key});

  @override
  State<SearchRecipeView> createState() => _SearchRecipeViewState();
}

class _SearchRecipeViewState extends State<SearchRecipeView> {
  late final TextEditingController _searchFieldController;

  @override
  void initState() {
    super.initState();
    _searchFieldController = TextEditingController()..addListener(_onSearchQueryChanged);
  }

  @override
  void dispose() {
    _searchFieldController.removeListener(_onSearchQueryChanged);
    _searchFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.recipesTitle)),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 16),
                Expanded(
                  child: SearchTextField(
                      labelText: AppStrings.searchRecipeLabel,
                      controller: _searchFieldController,
                      onSubmitted: (query) => context.read<SearchRecipeCubit>().searchRecipe(query: query)),
                ),
                const SizedBox(width: 4),
                IconButton(
                  icon: Icon(
                    Icons.add,
                    size: 28,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  onPressed: _onCreateRecipePressed,
                ),
                const SizedBox(width: 16),
              ],
            ),
            const SizedBox(height: 12),
            const AppDivider(),
            Expanded(
              child: BlocBuilder<SearchRecipeCubit, SearchRecipeState>(
                builder: (context, state) {
                  final searchResults = state.searchResults;
                  final allRecipes = state.allRecipes.data ?? [];
                  final query = _searchFieldController.text;
                  final results = query.isEmpty ? allRecipes : searchResults;

                  return switch (state.allRecipes.status) {
                    LoadingStatus _ => const Center(child: CircularProgressIndicator()),
                    FailureStatus _ => RefreshIndicator(
                        onRefresh: () async => await _refreshRecipes(context), child: ListView(children: const [Center(child: GeneralErrorView())])),
                    SuccessStatus _ => RefreshIndicator(
                        onRefresh: () async => await _refreshRecipes(context),
                        child: results.isEmpty
                            ? ListView(children: const [EmptyView()])
                            : ListView.builder(
                                itemBuilder: (_, index) => RecipeItem(
                                  recipe: results[index],
                                  showTopDivider: index != 0,
                                ),
                                itemCount: results.length,
                              ),
                      ),
                    _ => const SizedBox.shrink(),
                  };
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _refreshRecipes(BuildContext context) async {
    final cubit = context.read<SearchRecipeCubit>();
    final query = _searchFieldController.text;
    query.isEmpty ? await cubit.fetchRecipes() : cubit.searchRecipe(query: query);
  }

  void _onSearchQueryChanged() => _refreshRecipes(context);

  void _onCreateRecipePressed() => Navigator.of(context).pushNamed(Routes.createRecipe.name);
}
